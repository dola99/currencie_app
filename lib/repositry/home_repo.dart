import 'package:currencie_app/models/data/currencie_model.dart';
import 'package:currencie_app/network/networkCallback/network_callback.dart';
import 'package:currencie_app/network/services_urls.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:either_dart/either.dart';

class HomeRepo {
  Future<Either<String, CurrencySupportedModel>>
      getAllSupportedCurrencey() async {
    final response = await NetworkCall().makeCall(
        method: HttpMethod.GET, endPoint: ServicesURLs.supportedCurrenceyUrl);
    print(response);
    if (response!['success']) {
      return const Left("Opps UnExpected error");
    } else {
      return Right(CurrencySupportedModel.fromJson(response));
    }
  }
}
