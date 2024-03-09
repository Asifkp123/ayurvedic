import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testayurvedicproject/constants/functions.dart';
import 'package:testayurvedicproject/presentation/patient_listing/patient_list_provider.dart';
import 'package:testayurvedicproject/presentation/registration/patient_regscreen.dart';

import '../../constants/colors.dart';
import '../registration/reg_provider.dart';

class PatientsListingScreen extends StatelessWidget {
  String token;
   PatientsListingScreen({super.key,required this.token});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    RegistrationProvider registrationProvider = Provider.of<RegistrationProvider>(context, listen: false);

    return Scaffold(appBar:AppBar(
      leading: const Icon(Icons.arrow_back),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications_none),
        ),
      ],

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton:                         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        width: width,
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: maingreen,
          borderRadius: BorderRadius.circular(9),
        ),
        child: TextButton(
          onPressed: ()  {
            registrationProvider.fetchBranchList(token);
            callNext(PatientRegistrationScreen(), context);
          },
          style: TextButton.styleFrom(
            foregroundColor: cWhite,
          ),
          child: Text(
            'Register Now',
            style: LoginStyleWhite,
          ),
        ),
      ),
    )
      ,
    body:         SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10,),
              SizedBox(
                width: width/1.5,
                height: 50,
                child: Consumer<RegistrationProvider>(
                    builder: (context,provider,child) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: cBlack),
                          borderRadius: BorderRadius.circular(9)
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          onChanged: (text) {
                            // provider.searchDistributorsList(text);
                          },
                          decoration:
                          const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search for treatments",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily: "PoppinsMedium",
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(27)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(27)),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),

              Flexible(
                fit:  FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    width: width,
                    // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: maingreen,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: TextButton(
                      onPressed: () async {

                      },
                      style: TextButton.styleFrom(
                        foregroundColor: cWhite,
                      ),
                      child: Text(
                        'Search',
                        style: textformHeadStyleWhite,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          const SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Flexible(
                      fit: FlexFit.tight,
                      child: Text("Sort by :",style: TextStyle(
                          fontFamily: 'Poppins',
                          color: cBlack,
                          fontSize: 16,
                          // height: 0.5,
                          fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(color: cBlack),
                        borderRadius: BorderRadius.circular(22),

                      ),
                      child: const Center(child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text('Date',style: TextStyle(
                                fontFamily: 'Poppins',
                                color: cBlack,
                                fontSize: 16,
                                // height: 0.5,
                                fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down_rounded,color: maingreen,)
                          ],
                        ),
                      ),
                    ),)

                              ],
                ),
              ],
            ),
          ),
          const Divider(color: mainColor,height: 10,thickness: 2,),
          Consumer<PatientsListProvider>(
            builder: (context,value1,child) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),

                shrinkWrap: true,
                itemCount: value1.patients.length,
                itemBuilder: (context, index) {
                  var  item = value1.patients[index];
                  int indexCount =index+1;

                  return Container(
                    height: height/5,
                    width: width,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                            children: [
                              Text("$indexCount . ",style: TextStyle( fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w500),),
                              Text(  item.user != null ? item.user : 'Unknown Name',style: TextStyle( fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w500),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                           Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(item.treatmentName,style: TextStyle( fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w500,color: maingreen),),
                          ),
                          const SizedBox(height: 10,),

                           Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 17,),
                              Row(children: [ Icon(Icons.calendar_month,color: Colors.red,),
                                Text(item.dateAndTime,style: TextStyle( fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w500,color: Colors.grey),),

                              ]),
                              Row(children:[ Icon(Icons.person_rounded,color: Colors.red,),
                                Text(item.name,style: TextStyle( fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w500,color: Colors.grey),),
                              ]),
                              SizedBox(height: 10,),




                            ],
                          ),
                          const SizedBox(height: 10,),

                          Divider(color: Colors.grey.shade400,height: 10,thickness: 2,),
                          const SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(),
                              Text("View Booking details",style: textformHeadStyle,),
                              const Icon(Icons.arrow_forward_ios_outlined,color: maingreen,)
                            ],
                          )


                        ],
                      ),
                    ),
                  );
                },
              );
            }
          )
        ],
      ),
    ),



    );
  }
}
