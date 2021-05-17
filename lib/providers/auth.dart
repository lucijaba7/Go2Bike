import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _username;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get username {
    return _username;
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse('https://go2bikeapitest.azurewebsites.net/token');

    final data = {
      'grant_type': 'password',
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept-Language': 'hr'
        },
        body: data,
      );

      final responseData = json.decode(response.body);

      _token = responseData['access_token'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: responseData['expires_in'],
        ),
      );
      _username = responseData['userName'];

      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'username': _username,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String username, String email, String password,
      String confirmPassword, String operatorId) async {
    final url =
        Uri.parse('https://go2bikeapitest.azurewebsites.net/accounts/register');

    final data = {
      'username': username,
      'email': email,
      'password': password,
      'confirmpassword': confirmPassword,
      'operatorId': operatorId
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept-Language': 'hr'
        },
        body: data,
      );

      final responseData = json.decode(response.body);
      print(responseData);
      // _token = responseData['access_token'];
      // _expiryDate = DateTime.now().add(
      //   Duration(
      //     seconds: responseData['expires_in'],
      //   ),
      // );
      // print(responseData);
      // notifyListeners();

      _autoLogout();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'username': _username,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _username = extractedUserData['username'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _username = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
