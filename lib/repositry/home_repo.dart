import 'package:currencie_app/models/data/currencie_model.dart';
import 'package:currencie_app/network/networkCallback/network_callback.dart';
import 'package:currencie_app/network/services_urls.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepo {
  Future<Either<String, CurrencySupportedModel>>
      getAllSupportedCurrencey() async {
    final response = await NetworkCall().makeCall(
        method: HttpMethod.GET,
        endPoint: ServicesURLs.supportedCurrenceyUrl,
        queryParams: {'apiKey': dotenv.env['API_KEY']});
    print(response);
    if (response?['status'] != null &&
        (response!['status'] < 200 || response['status'] > 300)) {
      print(response['error']);
      return Left(response['error']);
    } else {
      return Right(CurrencySupportedModel.fromJson(response!));
    }
  }
}
