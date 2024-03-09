import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testayurvedicproject/presentation/pdf/pdf_provider.dart';
import 'package:testayurvedicproject/presentation/registration/reg_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../widgets/textFormFeild.dart';

addCategoryAlert(context,) async {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  return await showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Form(
          key: formKey1,
          child: AlertDialog(
            surfaceTintColor: clWhite,
            // shadowColor: Colors.transparent,
            backgroundColor: clWhite,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            content: Consumer<RegistrationProvider>(
              builder: (context,value1,child) {
                return Container(
                  width: width * .70,
                  height: height / 2.7,
                  decoration: BoxDecoration(
                    color: clWhite,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Choose Treatment" ,style: textformHeadStyle),
                      SizedBox(height: 8,),
                      Consumer<RegistrationProvider>(
                          builder: (context,value,child) {
                            return Autocomplete<String>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                return (value.locations).where((String place) => place.toLowerCase()
                                    .contains(textEditingValue.text.toLowerCase()))
                                    .toList();
                              },
                              displayStringForOption: (String option) => option,
                              fieldViewBuilder: (
                                  BuildContext context,
                                  TextEditingController fieldTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted
                                  ) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {

                                  fieldTextEditingController.text=value.locationCT.text;
                                });

                                return SizedBox(

                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Choose your location',
                                      hintStyle:TextStyle(color: Colors.grey,fontSize: 16),
                                      border: InputBorder.none,

                                      fillColor: mainColor,
                                      filled: true,
                                      suffixIcon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 20,
                                        color: Colors.black38,
                                      ),

                                    ),

                                    validator: (text){
                                      if(text!.isEmpty&& !value.locations.contains(text)){
                                        return 'Location';
                                      }else{
                                        return null;
                                      }
                                    },


                                    onChanged: (value){
                                    },
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,

                                    style:  TextStyle(
                                      color: clBlack.withOpacity(.30),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              },
                              onSelected: (String selection) {
                                value.locationCT.text=selection;
                                FocusManager.instance.primaryFocus?.unfocus();

                              },

                              optionsViewBuilder: (
                                  BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options
                                  ) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    child: Card(
                                      elevation: 3,
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: width/1.2,
                                        height: 200,
                                        color: Colors.white,
                                        child: ListView.builder(
                                          // padding: const EdgeInsets.all(10.0),
                                          itemCount: options.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            final String option = options.elementAt(index);

                                            return GestureDetector(
                                              onTap: () {
                                                onSelected(option);
                                                print(option+'kododoa');
                                              },
                                              child:  Container(
                                                color: Colors.white,
                                                height: 54,
                                                width: width,
                                                child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(option,
                                                          style:    const TextStyle(
                                                            color: clBlack,
                                                            fontSize: 13,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w600,
                                                          ),

                                                        ),
                                                      ),
                                                      const SizedBox(height: 10)
                                                    ]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                      ),
                      const SizedBox(height: 10),

                      Text(" Add Patients" ,style: textformHeadStyle),

                      const SizedBox(height: 20),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: Colors.grey)

                          ),),
                          const SizedBox(width: 25,),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 22,

                                backgroundColor: maingreen,
                                child: Icon(Icons.remove,color: clWhite,),
                              ),
                              Chip(label: Text('1')),
                              CircleAvatar(
                                radius: 22,

                                backgroundColor: maingreen,
                                child: Icon(Icons.add,color: clWhite,),
                              ),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.grey)

                            ),),
                          const SizedBox(width: 25,),

                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: maingreen,
                            child: Icon(Icons.remove,color: clWhite,),
                          ),
                          const Chip(label: Text('1')),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: maingreen,
                            child: Icon(Icons.add,color: clWhite,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),


                      Consumer<PdfProvider>(
                        builder: (context,value11,child) {
                          return Container(
                            height: 45,
                            width: width,
                            // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: maingreen,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: TextButton(
                              onPressed: ()  {
                                value11.savePdf();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: cWhite,
                              ),
                              child: Text(
                                'Login',
                                style: textformHeadStyleWhite,
                              ),
                            ),
                          );
                        }
                      )

                    ],
                  ),
                );
              }
            ),
          ),
        );
      });
}