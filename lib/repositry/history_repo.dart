import 'package:currencie_app/models/data/history_currency_model.dart';
import 'package:currencie_app/network/networkCallback/network_callback.dart';
import 'package:currencie_app/network/services_urls.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HistoryRepo {
  Future<Either<String, HistoryCurrencyModel>> getHistoryOfCurrency() async {
    var startDate = DateTime.now()
        .subtract(const Duration(days: 7))
        .toIso8601String()
        .substring(0, 10);
    var endDate = DateTime.now().toIso8601String().substring(0, 10);
    final response = await NetworkCall().makeCall(
        method: HttpMethod.GET,
        endPoint: ServicesURLs.convertUrl,
        queryParams: {
          'apiKey': dotenv.env['API_KEY'],
          'q': 'EUR_EGP',
          'compact': 'ultra',
          'endDate': endDate,
          'date': startDate
        });
    if (response?['status'] != null &&
        (response!['status'] < 200 || response['status'] > 300)) {
      return Left(response['error']);
    } else {
      return Right(HistoryCurrencyModel.fromJson(response!));
    }
  }
}
