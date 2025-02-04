import 'dart:convert';
import 'dart:io';

import 'package:bike_shopping/data/app.exceptions.dart';
import 'package:bike_shopping/data/remote/network/base.api.service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(baseURL + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, String> jsonBody) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(Uri.parse(baseURL + url), body: jsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
