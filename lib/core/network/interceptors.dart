import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  final String apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = apiKey;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final parsedResponse = {
      'data': response.data,
      'statusCode': response.statusCode,
      'statusMessage': response.statusMessage,
    };

    response.data = parsedResponse;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = "";

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "La conexión con la API ha expirado.";
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            "La API tiene problemas técnicos (Error ${err.response?.statusCode} ${err.response?.statusMessage}).";
        break;
      default:
        errorMessage = "¡Ups! Algo salió mal... Inténtalo de nuevo más tarde.";
    }

    final parsedError = err.copyWith(message: errorMessage);
    super.onError(parsedError, handler);
  }
}
