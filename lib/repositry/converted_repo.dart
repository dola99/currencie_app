import 'package:currencie_app/network/networkCallback/network_callback.dart';
import 'package:currencie_app/network/services_urls.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConvertedRepo {
  Future<Either<double, double>> convertedCurrency(
      String firstCurrencie, String secondCurrencie) async {
    Either<double, double> result;
    final response = await NetworkCall().makeCall(
        method: HttpMethod.GET,
        endPoint: ServicesURLs.convertUrl,
        queryParams: {
          'q': '${firstCurrencie}_PHP,${secondCurrencie}_PHP',
          'compact': 'ultra',
          'apiKey': dotenv.env['API_KEY']
        });
    result = Right(response!['${firstCurrencie}_PHP']);
    result = Left(response['${secondCurrencie}_PHP']);

    return result;
  }
}
