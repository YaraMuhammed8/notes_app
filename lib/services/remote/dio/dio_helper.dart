import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://team1-github-180daraga.herokuapp.com/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return dio.post(url, queryParameters: query,data: data);
  }
}