import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    Key? key,
    required this.inputController,
    required this.label,
    required this.error,
    required this.type,


  }) : super(key: key);

  final TextEditingController inputController;
  final String label;
  final String error;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {

    return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
        // color: Colors.black,
    borderRadius: BorderRadius.circular(10),),
      child: TextFormField(
        keyboardType: type,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
        controller: inputController,
        decoration: InputDecoration(
          hintText: label,
            hintStyle:TextStyle(color: Colors.grey),


            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),

            borderSide: BorderSide.none,

          ),
          fillColor: mainColor,
          filled: true,

        ),
      ),
    );
  }
}