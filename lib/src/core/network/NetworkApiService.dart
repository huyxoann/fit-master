// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/exception/app_exception.dart';
import 'package:http/http.dart';

import 'BaseApiService.dart';

class NetworkApiService extends BaseApisService {
  @override
  Future getApiResponse(String url, String? token,
      {Map<String, String>? params}) async {
    dynamic responseJson;
    try {
      Uri uri = Uri.parse(url);
      logger.d("params nhan la ${params!}");
      uri = uri.replace(queryParameters: params);
      final headers = {
        HttpHeaders.authorizationHeader: '$token',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final response =
          await get(uri, headers: headers).timeout(const Duration(seconds: 5));
      logger.d("in network service ${returnResponse(response)}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      print("ee $e");
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data, String? token) async {
    dynamic responseJson;
    try {
      final headers = {
        HttpHeaders.authorizationHeader: '$token',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      Response response =
          await post(Uri.parse(url), body: jsonEncode(data), headers: headers)
              .timeout(const Duration(seconds: 10));

      print("data ${response.body}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  @override
  Future putApiResponse(String url, dynamic data, String? token) async {
    dynamic responseJson;
    try {
      final headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      Response response =
          await put(Uri.parse(url), body: jsonEncode(data), headers: headers)
              .timeout(const Duration(seconds: 10));

      print("data ${response.body}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  @override
  Future fileApiResponse(String url, File data, String? token) async {
    dynamic responseJson;
    try {
      final headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final request = MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(await MultipartFile.fromPath('file', data.path));

      var streamedResponse = await request.send();
      var response = await Response.fromStream(streamedResponse);
      print("data $response");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }
}

dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      // Kiểm tra nếu API trả về đúng kết quả
      if (responseJson['status'] == 200) {
        return responseJson[
            'metadata']; // Trả về danh sách bài tập từ 'metadata'
      } else {
        throw FetchDataException(
            'Unexpected status in response: ${responseJson['message']}');
      }
    case 201:
      dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      // Kiểm tra nếu API trả về đúng kết quả
      if (responseJson['status'] == 201) {
        return responseJson[
            'metadata']; // Trả về danh sách bài tập từ 'metadata'
      } else {
        throw FetchDataException(
            'Unexpected status in response: ${responseJson['message']}');
      }
    case 204:
      return true;
    case 400:
      throw BadRequestException(
          jsonDecode(response.body)['message'].toString());
    case 401:
      throw UnauthorisedException(
          jsonDecode(response.body)['message'].toString());
    case 500:
      throw BadRequestException(
          jsonDecode(response.body)['message'].toString());
    case 404:
      throw UnauthorisedException(
          jsonDecode(response.body)['message'].toString());
    default:
      throw FetchDataException(
          'Error accured while communicating with serverwith status code${response.statusCode}');
  }
}
