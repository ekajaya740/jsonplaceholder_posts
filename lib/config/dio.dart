import 'package:dio/dio.dart';

enum DioMethod { post, get, put, delete }

class DioService {
  DioService._singleton();

  static final DioService instance = DioService._singleton();

  final dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    formData,
  }) async {
    switch (method) {
      case DioMethod.post:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.get:
        return dio.get(
          endpoint,
          queryParameters: param,
        );
      case DioMethod.put:
        return dio.put(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.delete:
        return dio.delete(
          endpoint,
          data: param ?? formData,
        );
      default:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
    }
  }
}
