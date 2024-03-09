import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:testayurvedicproject/constants/functions.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patients_screen.dart';

class RegistrationProvider with ChangeNotifier {


  TextEditingController patientNameCT = TextEditingController();
  TextEditingController patientWTCT = TextEditingController();

}
