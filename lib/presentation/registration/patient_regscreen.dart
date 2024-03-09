import 'package:flutter/material.dart';
import 'package:testayurvedicproject/presentation/registration/reg_provider.dart';
import 'package:provider/provider.dart';
import 'package:testayurvedicproject/presentation/registration/widget/add_treatment_alert.dart';
import 'package:testayurvedicproject/widgets/radio_button.dart';

import '../../constants/colors.dart';
import '../../widgets/textFormFeild.dart';
import 'branches_model.dart';

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
                    Text("Location" ,style: textformHeadStyle),
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


                                  decoration: InputDecoration(
                                    hintText: 'Choose your location',
                                    hintStyle:TextStyle(color: Colors.grey,fontSize: 16),
                                    border: InputBorder.none,

                                    fillColor: mainColor,
                                    filled: true,
                                    suffixIcon: const Icon(
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

                    SizedBox(
                      height: 8,
                    ),
                    Text("Branches" ,style: textformHeadStyle),
                    SizedBox(height: 8,),

                    Consumer<RegistrationProvider>(
                        builder: (context,value,child) {
                          return Autocomplete<BranchModel>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              // return (value55.allWards)
                              return (value.branches)
                                  .where((BranchModel branch) =>
                              branch.name
                                  .toLowerCase()
                                  .contains(textEditingValue
                                  .text
                                  .toLowerCase()) ||
                                  branch.name
                                      .toLowerCase()
                                      .contains(textEditingValue
                                      .text
                                      .toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption:
                                (BranchModel option) => option.name,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) {
                                fieldTextEditingController.text =
                                    value.branchesCT.text;
                              });
                              return TextFormField(
                                decoration: InputDecoration(

                                  hintText: 'Select Branch',
                                  hintStyle: TextStyle(color: Colors.grey),

                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 20,
                                    color: Colors.black38,
                                  ),


                                  filled: true,
                                  fillColor: mainColor,

                                  border:InputBorder.none

                                ),
                                validator: (name) => name == '' ||
                                    !(value.branches)
                                        .map((e) => e.name)
                                        .contains(name)
                                    ? 'Please Enter Valid Branch Name'
                                    : null,
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                // style: const TextStyle(fontWeight: FontWeight.bold),
                              );
                            },
                            onSelected: (BranchModel selection) {

                              value.branchesCT.text=selection.name;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<BranchModel>
                                onSelected,
                                Iterable<BranchModel> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width / 1.5,
                                    height: 200,
                                    color: Colors.white,
                                    child: ListView.builder(
                                      padding:
                                      const EdgeInsets.all(10.0),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context,
                                          int index) {
                                        final BranchModel option =
                                        options.elementAt(index);

                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: Container(
                                            // height: 60,
                                            color: Colors.white,
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(option.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold)),

                                                  const SizedBox(
                                                      height: 10)
                                                ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
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
                          onPressed: ()  {
                            addCategoryAlert(context,);
          
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
            ],
          ),
        );
      }
    ),
    );
  }
}
