import 'package:dio/dio.dart';

class DioClient {
  Dio dioClient() {
    Dio dio = Dio();
    dio.options.baseUrl = "https://newsapi.org/v2";
    dio.options.connectTimeout = 6000;
    dio.options.receiveTimeout = 6000;
    dio.options.contentType = Headers.jsonContentType;
    return dio;
  }
}
