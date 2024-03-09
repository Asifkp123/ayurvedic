import 'package:flutter/material.dart';
import 'package:testayurvedicproject/logic/provider.dart';
import 'package:provider/provider.dart';
import 'package:testayurvedicproject/widgets/radio_button.dart';

import '../constants/colors.dart';
import '../widgets/textFormFeild.dart';

class PatientRegistrationScreen extends StatelessWidget {
  const PatientRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(appBar:AppBar(
      leading: const Icon(Icons.arrow_back),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications_none),
        ),
      ],

    ),
    body: Consumer<RegistrationProvider>(
      builder: (context,value1,child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Padding(
                padding: const EdgeInsets.only(left:30 ),
                child: Text('Register',style: LoginStyleBlack,),
              ),
               Divider(color: Colors.grey.shade200,height: 10,thickness: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
          
                    Text(" Name" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter your full name",
                        error: "Please Enter your full name",
                        type: TextInputType.name),
                    SizedBox(
                      height: 8,
                    ),
                    Text(" Whatsapp Number" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientWTCT,
                        label: "Enter your Whatsapp Number",
                        error: "Please Enter Whatsapp Number",
                        type: TextInputType.name),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Address" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientWTCT,
                        label: "Enter your full address",
                        error: "Please Enter your full address",
                        type: TextInputType.name),
                    SizedBox(
                      height: 8,
                    ),
                    Text("AUTO COMPLETE" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    Container(
                      color: Colors.red,
                      child: CustomTextFormField(
                          inputController: value1.patientWTCT,
                          label: "AUTO COMPLETE",
                          error: "AUTO COMPLETE",
                          type: TextInputType.name),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("AUTO COMPLETE" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    Container(
                      color: Colors.red,
                      child: CustomTextFormField(
                          inputController: value1.patientWTCT,
                          label: "AUTO COMPLETE",
                          error: "AUTO COMPLETE",
                          type: TextInputType.name),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Treatments" ,style: textformHeadStyle),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: width,
                      height: 85,
                      decoration: BoxDecoration(
                      color: mainColor,
                    ),
                     child: Column(
                       children: [
                         const Row(
                           children: [
                             SizedBox(width: 10,),
                             Flexible(
                                  fit: FlexFit.loose,
                                 child: Text('1.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,fontFamily: "Poppins"),)),
                             SizedBox(width: 8,),
                             Text('Couple Combo package i..',
                                 maxLines: 1,
                                 style: TextStyle(
          
                                 fontWeight: FontWeight.w500,fontSize: 18,fontFamily: "Poppins")),
                             Flexible(
                               fit: FlexFit.tight,
                               child: CircleAvatar(
                                 radius:12,
                                 backgroundColor: Color(0xffF21E1E),
                                   child: Icon(Icons.close,color: clWhite,)),
                             )
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Row(children:[ Text('Male',style: textformHeadStyleGreen),
                               Chip(label:Text("1",style: textformHeadStyleGreen,)),
          
                             ]),
                             Row(children:[ Text('Female',style: textformHeadStyleGreen),
                               Chip(label:Text("1",style: textformHeadStyleGreen,)),
          
                             ],
                         ),
                             Icon(Icons.edit,color: maingreen,)
                       ],
                     ),
          
          ])  ),
                    Center(
                      child: Container(
                        height: 60,
                        width: width,
                        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
          
                            color: Color(0xffc8e4cc),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () async {
          
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: cWhite,
                          ),
                          child: Text(
                            '+ Add Treatments',
                            style: LoginStyleBlack,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),


                    Text(" Total Amount" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter Total Amount",
                        error: "Please Enter Total Amount",
                        type: TextInputType.name),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(height: 8,),


                    Text(" Discount Amount" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter Discount Amount",
                        error: "Please Discount Amount",
                        type: TextInputType.name),
          
                   SizedBox(height: 8,),


                    Text("Payment Option" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    // CustomTextFormField(
                    //     inputController: value1.patientNameCT,
                    //     label: "Enter Discount Amount",
                    //     error: "Please Discount Amount",
                    //     type: TextInputType.name),
                    RadioButtonsRow(),

                    Text("Advance Amount" ,style: textformHeadStyle),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter Advance Amount",
                        error: "Please Advance Amount",
                        type: TextInputType.name),
                     SizedBox(height: 8,),
                    Text("Balance Amount" ,style: textformHeadStyle),

                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter Balance Amount",
                        error: "Please Balance Amount",
                        type: TextInputType.name),

                    SizedBox(height: 8,),
                    Text("Treatment Date" ,style: textformHeadStyle),
                    CustomTextFormField(
                        inputController: value1.patientNameCT,
                        label: "Enter Treatment Date",
                        error: "Please  Select Treatment Date",
                        type: TextInputType.name),
                    Text("Treatment Time" ,style: textformHeadStyle),

                    SizedBox(height: 10,)





                  ],
                ),
              ),

          
          
          
          // const SizedBox(height: 10),
          
            ],
          ),
        );
      }
    ),
    );
  }
}
