import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:testayurvedicproject/presentation/patient_listing/patient_get_model.dart';

class PatientsListProvider with ChangeNotifier {

  bool isLoading=false;
  List<PatientModel> patients = [];
  // List<dynamic> patients = [];

  Future<void> fetchPatients(String tokenfrom) async {
    print('clickedddd');
    isLoading = true;

    final baseUrl = 'https://flutter-amr.noviindus.in/api/';
    final patientListUrl = baseUrl + 'PatientList';

    final token = tokenfrom;

    final response = await http.get(
      Uri.parse(patientListUrl),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print('worked');
      final responseData = json.decode(response.body);
      print(response.body);
      if (responseData.containsKey('patient')) {
        // If the response data contains the key "patient"
        final List<dynamic> patientList = responseData['patient'];

        if (patientList.isNotEmpty) {
          // Process the patient data as needed
          patients = patientList.map((json) => PatientModel.fromJson(json)).toList();
          print('Number of patients: ${patients.length}');
        } else {
          print('The list of patients is empty.');
          // Handle the case where the list of patients is empty
        }
      } else {
        print('Response data does not contain a "patient" key.');
        // Handle the case where the response data does not contain the expected key
      }

      isLoading = false;
      notifyListeners();
    }
  }

}
