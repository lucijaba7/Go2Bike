import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:go2bike/models/operator.dart';
import 'package:http/http.dart' as http;

class PublicOperators with ChangeNotifier {
  List<Operator> _operators;

  // PublicOperators(this._operators);

  List<Operator> get operators {
    return [..._operators];
  }

  Future<void> fetchOperators() async {
    final url = Uri.parse(
        'https://go2bikeapitest.azurewebsites.net/operators/publicOperators');

    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body);

      final List<Operator> loadedOperators = [];
      responseData.forEach(
        (data) {
          var newOperator =
              Operator(operatorId: data['Id'], name: data['Name']);
          loadedOperators.add(newOperator);
        },
      );
      _operators = loadedOperators;

      notifyListeners();
      return true;
    } catch (error) {
      throw error;
    }
  }

  // Future<void> register(String username, String password, String confirmPassword, String operatorId){

  // }
}
