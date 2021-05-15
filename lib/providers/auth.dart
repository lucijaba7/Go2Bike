import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:go2bike/models/http_exception.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

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

      //Self check for custom errors

      //tu vrati error_description
      // if (responseData['error']) {
      //   throw HttpException(responseData['error']['message']);
      // }
      _token = responseData['access_token'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: responseData['expires_in'],
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  // Future<void> register(String username, String password, String confirmPassword, String operatorId){

  // }
}
