// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

//for log in purpose
  void logIn(String email, String password) async {
    try {
      setLoader(true);
      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        setLoader(false);
        print("Login Successflu");
      } else {
        setLoader(false);
        print("Login Failed");
      }
    } catch (e) {
      setLoader(false);
      print(e.toString());
    }
  }
}
