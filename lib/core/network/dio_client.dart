import 'package:dio/dio.dart';
import 'interceptors.dart';

class DioClient {
  final String _backendUrl = 'https://api.thecatapi.com/v1';

  final Dio _dio = Dio();
  Dio get dio => _dio;

  DioClient() {
    _dio.options.baseUrl = _backendUrl;
    _dio.options.connectTimeout = Duration(milliseconds: 5000);
    _dio.options.receiveTimeout = Duration(milliseconds: 3000);

    _dio.interceptors.addAll([CustomInterceptor()]);
  }
}
