import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/core/contants/server_contants.dart';
import 'package:music_app/core/failure/app_failure.dart';
import 'package:music_app/features/auth/model/user_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerContants.serverURL}/auth/signup"),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return Right(UserModel.fromMap(resBodyMap));
      } else {
        return Left(AppFailure(resBodyMap["detail"]));
      }
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerContants.serverURL}/auth/login"),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return Right(
          UserModel.fromMap(
            resBodyMap["user"],
          ).copyWith(token: resBodyMap["token"]),
        );
      } else {
        return Left(AppFailure(resBodyMap["detail"]));
      }
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
