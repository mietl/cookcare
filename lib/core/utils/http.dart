import 'package:cookcare/core/api/api_constants.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  static final HttpUtils _instance = HttpUtils._internal();

  static late final Dio dio;

  factory HttpUtils() => _instance;

  // 初始化构造
  HttpUtils._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstans.BASE_URL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio = Dio(options);

    dio.interceptors.add(ErrorInterceptor());
  }

  // get
  Future<Response> get(String path,
      {Map<String, dynamic>? query, Options? options}) async {
    var response =
        await dio.get(path, queryParameters: query, options: options);

    return response;
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? query, data, Options? options}) async {
    var response = await dio.post(path,
        data: data, queryParameters: query, options: options);

    return response;
  }
}

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioExceptionType.unknown:
        print(err.toString());
        handler.reject(err);
        break;
      default:
    }

    return super.onError(err, handler);
  }
}
