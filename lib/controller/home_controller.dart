import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lirarate/model/data_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  DataModel? data;
  var isLoading = false.obs;
  var isOffline = false.obs;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('data') == null || prefs.getString('data') == '') {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        isOffline.value = true;
      }
      fetchData();
    } else {
      isLoading.value = true;
      data = DataModel.fromJson(prefs.getString('data')!);
      isLoading.value = false;
    }
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final gasData = await _fetchGasData();
    final rateData = await _fetchRateData();
    gasData.addAll(rateData);
    data = DataModel.fromMap(gasData);
    prefs.setString('data', data?.toJson() ?? '');
    isLoading.value = false;
  }

  Future<Map<String, String>> _fetchGasData() async {
    try {
      final url = Uri.parse(
          'https://www.iptgroup.com.lb/ipt/en/our-stations/fuel-prices');
      final response = await http.get(url);
      dom.Document html = dom.Document.html(response.body);
      return {
        "unl95Price": html
            .getElementsByClassName('highlighted priceSpanWidth')[0]
            .innerHtml,
        "unl98Price": html
            .getElementsByClassName('highlighted priceSpanWidth')[1]
            .innerHtml,
        "diselPrice": html
            .getElementsByClassName('highlighted priceSpanWidth')[2]
            .innerHtml,
        "gasPrice": html
            .getElementsByClassName('highlighted priceSpanWidth')[3]
            .innerHtml,
        "gasCurrentTime": html
                .querySelector(
                    '#phBody_phSlaveBody_BICMSZone1_ctl00_ctl00_FuelPanel > h5 > span > span.normalTxt')
                ?.innerHtml ??
            '',
      };
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
    return {"Error": "Couldn't fetch the required data."};
  }

  Future<Map<String, String>> _fetchRateData() async {
    try {
      final url = Uri.parse('https://lbprate.com/');
      final response = await http.get(url);
      dom.Document html = dom.Document.html(response.body);
      List data = html.getElementsByClassName('col-md-4  text-center');
      return {
        "buyPrice": data[0].getElementsByTagName('span')[1].innerHtml,
        "sellPrice": data[1].getElementsByTagName('span')[1].innerHtml,
        "sayrafa": data[2].getElementsByTagName('span')[1].innerHtml,
        "rateCurrentTime":
            html.querySelector('body > nav > div > label')?.innerHtml ?? '00',
      };
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
    return {"Error": "Couldn't fetch the required data."};
  }
}
