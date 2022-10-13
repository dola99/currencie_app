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
          'q': '$firstCurrencie,$secondCurrencie',
          'compact': 'ultra',
          'apiKey': dotenv.env['API_KEY']
        });
    result = Right(response![firstCurrencie]);
    result = Left(response[secondCurrencie]);

    return result;
  }
}
