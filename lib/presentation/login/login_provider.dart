import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';


import 'package:http/http.dart' as http;
import 'package:testayurvedicproject/constants/functions.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patient_list_provider.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patients_screen.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController userNameCT = TextEditingController();
  TextEditingController userPassCT = TextEditingController();


  TextEditingController patientNameCT = TextEditingController();
  TextEditingController patientWTCT = TextEditingController();

  ///login
  Future<void> login(BuildContext context) async {

    PatientsListProvider patientsListprovider = Provider.of<PatientsListProvider>(context, listen: false);
    final baseUrl = 'https://flutter-amr.noviindus.in/api/';
    final loginUrl = baseUrl + 'Login';

    // Create FormData object
    final formData = http.MultipartRequest('POST', Uri.parse(loginUrl));

    // Add fields to the FormData object
    formData.fields.addAll({
      // 'username': userNameCT.text,
      // 'password': userPassCT.text,
      'username': "test_user",
      'password': "12345678",
    });

    try {
      final response = await formData.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final token = json.decode(responseData)['token']; // Assuming token is returned in response
        print('Token: $token');
        patientsListprovider.fetchPatients(token);
        callNext(PatientsListingScreen(token: token), context);
      } else {
        // Handle error
        print('Failed to login. Status code: ${response.statusCode}');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Please check your username and password.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while logging in.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    notifyListeners();
  }
}
