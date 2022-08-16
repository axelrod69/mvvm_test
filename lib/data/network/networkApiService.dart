import 'dart:io';
import '../appExceptions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './baseApiService.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    var jsonResponse;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return jsonResponse;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    var jsonResponse;

    try {
      final response =
          await http.post(Uri.parse(url), body: json.encode(data), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = json.decode(response.body);
        return jsonResponse;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error Occured while Communicating with server. Status Code ${response.statusCode}');
    }
  }
}
