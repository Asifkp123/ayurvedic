import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testayurvedicproject/constants/colors.dart';
import 'package:testayurvedicproject/widgets/textFormFeild.dart';
import '../logic/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Consumer<UserProvider>(builder: (context, value1, child) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: height / 3,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logoBg.png"))),
                    child: Image.asset("assets/logo.png", scale: 3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        Consumer<UserProvider>(builder: (context, value1, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login Or Register To Book \nYour Appointments",
                            style: LoginStyleBlack,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(" Email", style: textformHeadStyle),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFormField(
                                    inputController: value1.userNameCT,
                                    label: "Enter your email",
                                    error: "Please Enter your email",
                                    type: TextInputType.name),
                                SizedBox(
                                  height: 8,
                                ),
        // const SizedBox(height: 10),
                                Text(" Password" ,style: textformHeadStyle),
                                SizedBox(
                                  height: 8,
                                ),
        
                                CustomTextFormField(
                                    inputController: value1.userPassCT,
                                    label: "Enter Password",
                                    error: "Please enter the Password",
                                    type: TextInputType
                                        .name), // const SizedBox(height: 10),
        
                                SizedBox(
                                  height: 8,
                                ),
        
                                const SizedBox(height: 10),
                                // Center(
                                //   child: _isLoading
                                //       ? const CircularProgressIndicator()
                                //       : LoginFormButton(
                                //     formKey: _formKey,
                                //     userLogin: _userLogin,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Container(
                              height: 60,
                              width: width,
                              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: maingreen,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    value1.login(context  );
                                    // value1.sendotp(context);
                                  } else {
                                    // await  value1.sendPushNotification();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Error in Form")),
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: cWhite,
                                ),
                                child: Text(
                                  'Login',
                                  style: LoginStyleWhite,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: height/10,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Center(child: Text('By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy.')),
                  )
                ]);
          }),
        ),
      ),
    );
  }
}
