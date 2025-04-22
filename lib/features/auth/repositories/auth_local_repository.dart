import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_local_repository.g.dart';

@riverpod
AuthLocalRepository authLocalRepository(Ref ref) {
  return AuthLocalRepository();
}

class AuthLocalRepository {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setToken(String? token) {
    if (token != null) {
      _prefs.setString("x-auth-token", token);
    }
  }

  Future<String?> getToken() async {
    String? token = _prefs.getString("x-auth-token");
    return token;
  }
}
