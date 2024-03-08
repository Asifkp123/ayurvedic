import 'package:flutter/material.dart';
import 'package:testayurvedicproject/presentation/loginPage.dart';
import 'package:testayurvedicproject/presentation/patients_screen.dart';

import 'logic/provider.dart';
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
        ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:  PatientsListingScreen(),
    ) );
  }
}
