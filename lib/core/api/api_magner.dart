import 'package:dio/dio.dart';
import 'package:tasks/core/constants.dart';

class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio();
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(Constants.BASE_URL + endPoint,
        queryParameters: queryParam,
        options: Options(
          headers: headers,
        ));
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(Constants.BASE_URL + endPoint,
        data: body,
        options: Options(
          headers: headers,
        ));
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(Constants.BASE_URL + endPoint,
        data: body,
        options: Options(
          headers: headers,
        ));
  }

  Future<Response> deleteData(
    String endPoint,
  ) {
    return dio.delete(
      Constants.BASE_URL + endPoint,
    );
  }
}
