import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:park_and_fly/data/api_constants.dart';

import '../../models/token.dart';
import '../../models/user.dart';

abstract class AuthRepository{
  Token? get currentUserToken;

  Future<bool> login(User user);
  Future<bool> register(User user);
}

class AuthRepositoryImpl implements AuthRepository{
  Token? _currentUserToken;

  @override
  Token? get currentUserToken => _currentUserToken;

  AuthRepositoryImpl();

  @override
  Future<bool> login(User user) async{
    var request = post(Uri.parse('${ApiConstants.HTTPS_BASE_URL}/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user));

    try{
      var response = await request.timeout(Duration(seconds: 3));

      if (response.statusCode == 200) {
        // User is registered successfully
        // TODO: Auto login?
        return true;
      } else {
        log(response.headers.toString());
        log(response.statusCode.toString());
        log(response.body);
        return false;
      }
    }on Exception catch (e){
      log('$e');

      return false;
    }
  }

  @override
  Future<bool> register(User user) async {
    var request = post(Uri.parse('${ApiConstants.HTTPS_BASE_URL}/register/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user));

    try {
      var response = await request.timeout(Duration(seconds: 3));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return true;
      } else {
        log(response.headers.toString());
        log(response.statusCode.toString());
        log(response.body);
        return false;
      }
    } on Exception catch (e) {
      log('$e');
      return false;
    }
  }

}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

