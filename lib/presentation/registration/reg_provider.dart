import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:testayurvedicproject/constants/functions.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patients_screen.dart';
import 'package:testayurvedicproject/presentation/registration/branches_model.dart';

class RegistrationProvider with ChangeNotifier {


  TextEditingController patientNameCT = TextEditingController();
  TextEditingController patientWTCT = TextEditingController();
  TextEditingController locationCT = TextEditingController();
  TextEditingController branchesCT = TextEditingController();
  TextEditingController treatmentCT = TextEditingController();


  List<String> locations=['malappuram','kozhikkod','kannur','thrissur','vazhanad'];
  List<BranchModel> branches = [];

  Future<List<BranchModel>> fetchBranchList(String token) async {
    final baseUrl = 'https://flutter-amr.noviindus.in/api/';
    final branchListUrl = baseUrl + 'BranchList';

    try {
      final response = await http.get(
        Uri.parse(branchListUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('branches') && data['branches'] is List) {
          final List<dynamic> branchData = data['branches'];
          branches = branchData.map((branchJson) => BranchModel.fromJson(branchJson)).toList();
          print('${branches.length} branches fetched');
        } else {
          throw Exception('Invalid data format or missing "branches" key');
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      print('Error: $error');
    }

    return branches;
  }}
