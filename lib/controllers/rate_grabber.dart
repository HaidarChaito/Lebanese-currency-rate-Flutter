import 'package:lirarate/models/rate_data.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class RateGrabber {
  RateData rateData =
      RateData(buyPrice: '0', sellPrice: '0', currentTime: '0', sayrafa: '0');
  Future<bool> fetchData() async {
    try {
      final url = Uri.parse('https://lbprate.com/');
      final response = await http.get(url);
      dom.Document html = dom.Document.html(response.body);
      List data = html.getElementsByClassName('col-md-4  text-center');

      rateData.buyPrice = data[0].getElementsByTagName('span')[1].innerHtml;
      rateData.sellPrice = data[1].getElementsByTagName('span')[1].innerHtml;
      rateData.sayrafa = data[2].getElementsByTagName('span')[1].innerHtml;

      rateData.currentTime =
          html.querySelector('body > nav > div > label')?.innerHtml ?? '00';

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
