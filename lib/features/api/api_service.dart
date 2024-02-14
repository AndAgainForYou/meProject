import 'package:dio/dio.dart';

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
}

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'http://16.171.1.90/api/v1';

  ApiService() : _dio = Dio(BaseOptions(baseUrl: 'http://16.171.1.90/api/v1'));

  Future<Map<String, dynamic>> fetchData(
      String path, Map<String, dynamic> getData) async {
    try {
      final response = await _dio.get(
        path,
        data: getData,
        queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
        options: _getTokenOptions(),
      );
      return response.data;
    } catch (error) {
      print('Error fetching data: $error');
      return {'error': 'Failed to fetch data'};
    }
  }

  Future<Map<String, dynamic>> postData(
      String path, Map<String, dynamic> postData) async {
    try {
      final response = await _dio.post(
        path,
        data: postData,
        queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
        options: _getTokenOptions(),
      );
      return response.data;
    } catch (error) {
      print('Error posting data: $error');
      return {'error': 'Failed to post data'};
    }
  }

  Future<Map<String, dynamic>> putData(
      String path, Map<String, dynamic> putData) async {
    try {
      final response = await _dio.put(
        path,
        data: putData,
        queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
        options: _getTokenOptions(),
      );
      return response.data;
    } catch (error) {
      print('Error putting data: $error');
      return {'error': 'Failed to put data'};
    }
  }

  Future<Map<String, dynamic>> deleteData(
      String path, Map<String, dynamic> deleteData) async {
    try {
      final response = await _dio.delete(
        path,
        data: deleteData,
        queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
        options: _getTokenOptions(),
      );
      return response.data;
    } catch (error) {
      print('Error deleting data: $error');
      return {'error': 'Failed to delete data'};
    }
  }

  Future<Map<String, dynamic>> patchData(
      String path, Map<String, dynamic> patchData) async {
    try {
      final response = await _dio.patch(
        path,
        data: patchData,
        queryParameters: TokenManager._token?.isNotEmpty == true
          ? {'user_id': TokenManager.getUserId()}
          : null,
        options: _getTokenOptions(),
      );
      return response.data;
    } catch (error) {
      print('Error patching data: $error');
      return {'error': 'Failed to patch data'};
    }
  }

  Options _getTokenOptions() {
    return Options(
      headers: TokenManager.getTokensData()?.isNotEmpty == true
          ? {'Authorization': 'Bearer ${TokenManager.getTokensData()?['access']}'}
          : null,
    );
  }
}
