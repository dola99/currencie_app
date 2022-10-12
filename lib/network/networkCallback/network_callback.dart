import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:currencie_app/network/client/api_client.dart';
import 'package:currencie_app/utils/enums.dart';
import 'package:http/http.dart';

class NetworkCall {
  Future<Map<String, dynamic>?> makeCall({
    String? endPoint,
    HttpMethod? method,
    dynamic requestBody,
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
    List<MultipartFile>? multiPartValues,
  }) async {
    try {
      late Response response;
      if (method == HttpMethod.GET) {
        response = await ApiClient.getRequest(endPoint, queryParams);
      } else if (method == HttpMethod.POST) {
        response = await ApiClient.postRequest(
          endPoint!,
          requestBody,
          isMultipart: isMultipart,
          multiPartValues: multiPartValues,
        );
      } else if (method == HttpMethod.PUT) {
        response = await ApiClient.putRequest(
          endPoint!,
          requestBody,
          isMultipart: isMultipart,
          multiPartValues: multiPartValues,
        );
      } else if (method == HttpMethod.DELETE) {
        response = await ApiClient.deleteRequest(endPoint, queryParams);
      }

      ////      if (response.statusCode >= NetworkStatusCodes.OK_200.value&&response.statusCode<= NetworkStatusCodes.OK_299.value) {
      // if (response.statusCode == NetworkStatusCodes.OK_200.value) {
      if (response.statusCode >= (NetworkStatusCodes.OK_200.value as num) &&
          response.statusCode <= (NetworkStatusCodes.OK_299.value as num)) {
        //Api logger
        log("Api Response: ${response.body}");
        return jsonDecode(response.body) as Map<String, dynamic>?;
      } else if (response.statusCode ==
              NetworkStatusCodes.ServerInternalError.value ||
          response.statusCode == NetworkStatusCodes.BadRequest.value) {
        //Api logger
        log("API Error: ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        //log("API Error:${response.body}");
        final result = jsonDecode(response.body) as Map<String, dynamic>?;
        log('$result');
        return result;
      } else if (response.statusCode ==
          NetworkStatusCodes.UnAuthorizedUser.value) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;

        result['status'] = response.statusCode;

        //Api logger
        log("API Error: ${response.statusCode} / ${response.reasonPhrase} - $result");
        return result;
      } else {
        //Api logger
        log("API Error: ${response.statusCode} /-/ ${response.reasonPhrase} - ${response.body}");
        /*return {
          "success": false,
          "error": {
            "code": response.statusCode,
            "message": response.reasonPhrase,
            "details": ""
          }
        };*/
        final result = jsonDecode(response.body) as Map<String, dynamic>?;
        return result;
        //return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return {
        "success": false,
        "error": {
          "code": 0,
          "message":
              "No internet connection, please check you network and try again",
          "details": ""
        }
      };
    }
  }
}
