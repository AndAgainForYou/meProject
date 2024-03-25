import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class TokenManager {
  static String? _token;
  static String? _userId;
  static Map<String, dynamic>? _tokensData;

  static String? getToken() {
    return _token;
  }

  static void saveToken(String token) {
    _token = token;
  }

  static void saveUserId(String userId) {
    _userId = userId;
  }

  static String? getUserId() {
    return _userId;
  }

  static void updateTokensValue(String key, dynamic value) {
    if (_tokensData != null) {
      _tokensData![key] = value;
    }
  }

  static void saveTokensData(Map<String, dynamic> tokensData) {
    _tokensData = tokensData;
  }

  static Map<String, dynamic>? getTokensData() {
    return _tokensData;
  }

  static void clearTokens() {
    _token = null;
    _userId = null;
    _tokensData = null;
    print('token cleared');
  }
}

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'http://16.171.254.131/api/v1';

  ApiService()
      : _dio = Dio(BaseOptions(baseUrl: 'http://16.171.254.131/api/v1'));

  Future<void> refreshToken() async {
    print('Refreshing');
    final response = await _dio.post(
      '/jwt/refresh/',
      data: {'refresh': TokenManager.getTokensData()?['refresh']},
      options: _getTokenOptions(),
    );
    if (response.statusCode == 200) {
      print(response.data);
      TokenManager.saveTokensData(response.data);
      print("Token refreshed");
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<Map<String, dynamic>> fetchData(
      String path, Map<String, dynamic> getData) async {
    final response = await _dio.get(
      path,
      data: getData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    print(response.statusCode);
    if (response.statusCode == 401) {
      await refreshToken();
      return fetchData(path, getData);
    } else {
      return response.data;
    }
  }

  Future<List> fetchDataPlan(String path, Map<String, dynamic> getData) async {
    final response = await _dio.post(
      path,
      data: getData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    print(response.statusCode);
    if (response.statusCode == 401) {
      await refreshToken();
      return fetchDataPlan(path, getData);
    } else {
      return response.data;
    }
  }

  Future<Map<String, dynamic>> postData(
      String path, Map<String, dynamic> postsData) async {
    final response = await _dio.post(
      path,
      data: postsData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    if (response.statusCode == 401) {
      await refreshToken();
      return postData(path, postsData);
    } else {
      return response.data;
    }
  }

  Future<Map<String, dynamic>> putData(
      String path, Map<String, dynamic> putsData) async {
    final response = await _dio.put(
      path,
      data: putsData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    if (response.statusCode == 401) {
      await refreshToken();
      return putData(path, putsData);
    } else {
      return response.data;
    }
  }

  Future<bool> deleteData(String path, Map<String, dynamic> deletesData) async {
    final response = await _dio.delete(
      path,
      data: deletesData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    if (response.statusCode == 401) {
      await refreshToken();
      return deleteData(path, deletesData);
    } else {
      return response.statusCode == 200;
    }
  }

  Future<Map<String, dynamic>> patchData(
      String path, Map<String, dynamic> patchsData) async {
    final response = await _dio.patch(
      path,
      data: patchsData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: _getTokenOptions(),
    );
    if (response.statusCode == 401) {
      await refreshToken();
      return patchData(path, patchsData);
    } else {
      return response.data;
    }
  }

  Future<Map<String, dynamic>> postImage(String path, XFile imageFile) async {
    final formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        imageFile.path, // Pass imageFile.path instead of imageFile
        filename: 'image.jpg',
      ),
    });

    final response = await _dio.post(
      path,
      data: formData,
      queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
      options: Options(
        headers: TokenManager.getTokensData()?.isNotEmpty == true
            ? {
                'Authorization':
                    'Bearer ${TokenManager.getTokensData()?['access']}'
              }
            : null,
        followRedirects: false,
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    if (response.statusCode == 401) {
      await refreshToken();
      return postImage(path, imageFile);
    } else {
      return response.data;
    }
  }

  Options _getTokenOptions() {
    return Options(
      headers: TokenManager.getTokensData()?.isNotEmpty == true
          ? {
              'Authorization':
                  'Bearer ${TokenManager.getTokensData()?['access']}'
            }
          : null,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
  }
}
