import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../providers/auth.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserProfile with ChangeNotifier {
  String username;
  String authToken;
  User _user;

  UserProfile(this.username, this.authToken, this._user);

  User get user {
    return _user;
  }

  void recieveToken(Auth auth, User user) {
    this.username = auth.username;
    this.authToken = auth.token;
    this._user = user;
  }

  Future<void> fetchUserProfile() async {
    print(authToken);
    final url = Uri.parse(
        'https://go2bikeapitest.azurewebsites.net/accounts/UserPersonalData?username=' +
            username);

    try {
      final response = await http
          .get(url, headers: {'Authorization': 'Bearer ' + authToken});
      final responseData = json.decode(response.body);

      print(responseData['Id']);

      bool isConfirmed =
          responseData['EmailConfirmed'] == 'true' ? true : false;

      final User newUser = User(
        responseData['Id'],
        responseData['UserName'],
        responseData['Name'],
        responseData['LastName'],
        responseData['Email'],
        false,
        responseData['PhoneNumber'],
        responseData['VatNum'],
        responseData['Address'],
        responseData['City'],
        52100,
        responseData['CountryId'],
        responseData['Country'],
        responseData['Info'],
      );

      _user = newUser;

      print(_user.name);

      notifyListeners();
      return true;
    } catch (error) {
      throw error;
    }
  }
}
