import 'package:currencie_app/network/networkCallback/network_callback.dart';
import 'package:currencie_app/network/services_urls.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConvertedRepo {
  Future<Map<String, dynamic>> convertedCurrency(
      String firstCurrencie, String secondCurrencie) async {
    Map<String, dynamic> result;
    final response = await NetworkCall().makeCall(
        method: HttpMethod.GET,
        endPoint: ServicesURLs.convertUrl,
        queryParams: {
          'q': '${firstCurrencie}_$secondCurrencie',
          'compact': 'ultra',
          'apiKey': dotenv.env['API_KEY']
        });
    result = {
      firstCurrencie: 1.0,
      secondCurrencie: response!['${firstCurrencie}_$secondCurrencie']
    };
    return result;
  }
}
