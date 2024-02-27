import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveCredentials({required String email, required String password}) async {
  try {
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: password);
  } catch (e) {
    print('Error saving credentials: $e');
  }
}

Future<Map<String, String?>> loadCredentials() async {
  try {
    final email = await _storage.read(key: 'email');
    final password = await _storage.read(key: 'password');

    return {'email': email, 'password': password};
  } catch (e) {
    print('Error loading credentials: $e');
    return {'email': null, 'password': null};
  }
}
Future<void> clearAllData() async {
    try {
      await _storage.deleteAll();
      print('data cleared');
    } catch (e) {
      print('Error clearing all data: $e');
    }
  }
}
