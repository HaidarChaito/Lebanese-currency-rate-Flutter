import 'package:lirarate/models/fuel_data.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class FuelGrabber {
  FuelData fuelData = FuelData(
      unl95Price: '0',
      unl98Price: '0',
      diselPrice: '0',
      gasPrice: '0',
      currentTime: '0');

  Future<bool> fetchData() async {
    try {
      final url = Uri.parse(
          'https://www.iptgroup.com.lb/ipt/en/our-stations/fuel-prices');
      final response = await http.get(url);
      dom.Document html = dom.Document.html(response.body);

      fuelData.unl95Price = html
          .getElementsByClassName('highlighted priceSpanWidth')[0]
          .innerHtml;
      fuelData.unl98Price = html
          .getElementsByClassName('highlighted priceSpanWidth')[1]
          .innerHtml;
      fuelData.diselPrice = html
          .getElementsByClassName('highlighted priceSpanWidth')[2]
          .innerHtml;
      fuelData.gasPrice = html
          .getElementsByClassName('highlighted priceSpanWidth')[3]
          .innerHtml;
      fuelData.currentTime = html
              .querySelector(
                  '#phBody_phSlaveBody_BICMSZone1_ctl00_ctl00_FuelPanel > h5 > span > span.normalTxt')
              ?.innerHtml ??
          '';
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
