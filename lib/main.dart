import 'package:flutter/material.dart';
import 'package:testayurvedicproject/presentation/login/loginPage.dart';
import 'package:testayurvedicproject/presentation/login/login_provider.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patient_list_provider.dart';
import 'package:testayurvedicproject/presentation/pdf/pdf_provider.dart';


import 'presentation/registration/reg_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => PatientsListProvider()),
        ChangeNotifierProvider(create: (context) => PdfProvider()),
    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:  LoginPage(),
    ) );
  }
}
