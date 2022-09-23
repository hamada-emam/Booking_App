import 'package:dio/dio.dart';

//not Ready yet
class ApiHelper {
  //!  implemented Later
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "http://api.mahmoudtaha.com",
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
    String lang = "en",
  }) async {
    dio.options.headers = {
      "Authorization": token,
      "Content-Type": "application/json",
      "lang": lang
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> query,
      required Map<String, dynamic> data,
      String? tokken}) async {
    dio.options.headers = {
      "Authorization": tokken,
      "lang": "en",
      "Content-Type": "application/json"
    };
    return dio.post(url, data: data);
  }

  static Future<Response> putData(
      {required String url,
      required Map<String, dynamic> query,
      required Map<String, dynamic> data,
      String? tokken}) async {
    dio.options.headers = {
      "Authorization": tokken,
      "lang": "en",
      "Content-Type": "application/json"
    };
    return dio.put(url, data: data);
  }
}
