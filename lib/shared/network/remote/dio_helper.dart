import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/', //your baseUrl
          receiveDataWhenStatusError: true //إستقبال الدتا حتى لو هناك خطأ
          ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token ?? '',
      'Content-Type': 'application/json',
      //lang
      //token
      //----
    };
    return dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token ?? '',
      'Content-Type': 'application/json',
      //lang
      //token
      //----
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> updateData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token ?? '',
      'Content-Type': 'application/json',
      //lang
      //token
      //----
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
