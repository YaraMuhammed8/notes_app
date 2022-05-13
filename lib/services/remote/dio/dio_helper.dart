import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://team5-github-180daraga.herokuapp.com/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<void> postData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.post(url, queryParameters: query,data: data);
  }
}