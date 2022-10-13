import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:currencie_app/network/services_urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  Map<String, String> headers() {
    final mHeaders = {
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.connectionHeader: 'keep-alive',
      HttpHeaders.cacheControlHeader: 'no-cache',
      HttpHeaders.contentTypeHeader: 'application/json',
      "Abp.TenantId": '1',
    };

    return mHeaders;
  }

  static Future<Response> getRequest(
    String? endPoint,
    Map<String, dynamic>? queryParams,
  ) async {
    //create url with (baseUrl + endPoint) and query Params if any
    final Uri url = Uri(
      scheme: ServicesURLs().developmentEnvironmentScheme,
      host: ServicesURLs().developmentEnvironmentWithoutHttp,
      path: endPoint,
      queryParameters: queryParams,
    );
    //String url = ServicesURLs.development_environment + endPoint;
    //network logger
    log('${url.toString()} "\n"  ${ApiClient().headers().toString()}');
    //print(url.queryParameters.toString());
    //GET network request call
    final response = await http.get(url, headers: ApiClient().headers());

    return response;
  }

  static Future<http.Response> postRequest(
    String endPoint,
    dynamic requestBody, {
    bool isMultipart = false,
    dynamic header,
    List<http.MultipartFile>? multiPartValues,
  }) async {
    //create url of (baseUrl + endPoint)
    final url = ServicesURLs().developmentEnvironment! + endPoint;
    //network logger
    log('$url "\n"  ${ApiClient().headers().toString()}');
    if (requestBody != null) log(requestBody.toString());
    //POST network request call

    http.Response response;
    if (!isMultipart) {
      log("*NotMultipart*");
      response = await http.post(
        Uri.parse(url),
        headers: ApiClient().headers(),
        body: requestBody,
      );
    } else {
      final uri = Uri.parse(url);
      final Map<String, dynamic> p =
          jsonDecode(requestBody.toString()) as Map<String, dynamic>;
      final Map<String, String> convertedMap = {};
      p.forEach((key, value) {
        convertedMap[key] = value.toString();
      });

      // log("Params:${p.runtimeType}");
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(ApiClient().headers())
        ..fields.addAll(convertedMap)
        ..files.addAll(multiPartValues!);

      // ..files.add(await http.MultipartFile.fromPath(
      //   '',
      //   requestBody.path,
      // )
      response = await http.Response.fromStream(await request.send());
    }

    return response;
  }

  static Future<http.Response> putRequest(
    String endPoint,
    dynamic requestBody, {
    bool isMultipart = false,
    List<http.MultipartFile>? multiPartValues,
  }) async {
    //create url of (baseUrl + endPoint)
    final url = ServicesURLs().developmentEnvironment! + endPoint;
    //network logger
    log('$url "\n"  ${ApiClient().headers().toString()}');
    if (requestBody != null) log(requestBody.toString());
    //POST network request call

    http.Response response;
    if (!isMultipart) {
      log("*NotMultipart*");
      response = await http.put(Uri.parse(url),
          headers: ApiClient().headers(), body: requestBody);
    } else {
      final uri = Uri.parse(url);
      final Map<String, dynamic> p =
          jsonDecode(requestBody.toString()) as Map<String, dynamic>;
      final Map<String, String> convertedMap = {};
      p.forEach((key, value) {
        convertedMap[key] = value.toString();
      });

      // log("Params:${p.runtimeType}");
      final request = http.MultipartRequest('PUT', uri)
        ..headers.addAll(ApiClient().headers())
        ..fields.addAll(convertedMap)
        ..files.addAll(multiPartValues!);

      // ..files.add(await http.MultipartFile.fromPath(
      //   '',
      //   requestBody.path,
      // )
      response = await http.Response.fromStream(await request.send());
    }

    return response;
  }

  static Future<Response> deleteRequest(
    String? endPoint,
    Map<String, dynamic>? queryParams,
  ) async {
    //create url with (baseUrl + endPoint) and query Params if any
    final url = Uri(
      scheme: ServicesURLs().developmentEnvironmentScheme,
      host: ServicesURLs().developmentEnvironmentWithoutHttp,
      //port: ServicesURLs.development_environment_port,
      path: endPoint,
      queryParameters: queryParams,
    );
    //String url = ServicesURLs.development_environment + endPoint;
    //network logger
    log('${url.toString()} "\n"  ${ApiClient().headers().toString()}');
    //print(url.queryParameters.toString());
    //GET network request call
    final response = await http.delete(url, headers: ApiClient().headers());

    return response;
  }
}
