import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_user_bloc/data/repository/global_variabel.dart';

class DioInstance {
  late Dio _dio;

  DioInstance() {
    _dio = Dio(
      BaseOptions(
        baseUrl: GlobalVariables.baseUrl,
      ),
    );

    initializeInterceptors();
  }


  // All Method of Requests
  Future<Response> getRequest({required String endpoint, bool? isAuthorize, Map<String, dynamic>? queryParameters}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters,
        options: Options(
            headers: {
              "Accept": "application/json",
              if (isAuthorize ?? false) "Authorization": "Bearer $token"
            }),
      );
    } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionTimeout || e.message!.contains('Failed host lookup')){
        throw Exception('Internet connection appears to be offline.');
      } else if(e.type == DioExceptionType.badResponse){
        throw Exception('Failed to connect to the server.');

      } else {
        print(e.message);
        throw Exception(e.message);
      }
    }

    return response;
  }

  Future<Response> postRequest({required String endpoint, bool? isAuthorize, Object? data, Map<String, dynamic>? queryParameters, bool? isMultipart, bool Function(int?)? validateStatus}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.post(
          endpoint,
          data: data,
          options: Options(
            validateStatus: validateStatus ,
              headers: {
                "Accept": "application/json",
                if (isMultipart ?? false) 'Content-Type': 'multipart/form-data',
                if (isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );
      if (response.statusCode == 200) {
        final newToken = response.data['token'];
        if (newToken != null) {
          await prefs.setString('token', newToken);
        }
      }
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> patchRequest({required String endpoint, bool? isAuthorize, Object? data, Map<String, dynamic>? queryParameters}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.patch(
          endpoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(
              headers: {
                "Accept": "application/json",
                if (isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );

    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }


  Future<Response> putRequest({required String endpoint, bool? isAuthorize, required Object data, bool? isMultipart}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.put(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if (isAuthorize ?? false) "Authorization": "Bearer $token",
                if (isMultipart ?? false) 'Content-Type': 'multipart/form-data',
              })
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest({required String endpoint, bool? isAuthorize, Object? data , Map<String, dynamic>? queryParameters}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.delete(
          endpoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(
              headers: {
                "Accept": "application/json",
                if (isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  void initializeInterceptors() {
    _dio.interceptors.add(
        InterceptorsWrapper(
            onError: (error, handler) {
              print("Error: ${error.message}");
              return handler.next(error);
            },
            onRequest: (request, handler) {
              print("${request.method} ${request.path}");
              print("Request Headers: ${request.headers}");
              print("Request Data: ${request.data}");
              return handler.next(request);
            },
            onResponse: (response, handler) {
              print("Response Data: ${response.data}");
              return handler.next(response);
            }
        )
    );
  }
}