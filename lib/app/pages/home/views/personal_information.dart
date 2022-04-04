import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utility/constants.dart';
import '../../../widgets/my_button.dart';
import '../../authentication/controller/sign_up_controller.dart';

class PersonalInformation extends GetView {
  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: BackButton(color: Colors.black,),
        title: Text("Account information",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          Container(
            height: getHight(context)*.09,
            width: getWidth(context),
            color: COLOR_2,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text("Personal information",style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),),
                )),
          ),
          Expanded(
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: 30),
                children: [
                  SizedBox(height: getHight(context)*.04),
                  //date of birth
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset("assets/icons/ic_date.svg",height: 22,color: Colors.black,),
                            ),
                            Text("Date of birth",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex:4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 35,
                                  child: Row(children: [
                                    Obx(() =>  DropdownButton(
                                      isDense: true,
                                     // isExpanded: true,
                                      underline: Container(),
                                      icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
                                      onChanged: (newValue) {signUpController.selectMonthValue(newValue!.toString());},
                                      value: signUpController.selectedMonthValue.value,
                                      items: MONTHS.map((value) {
                                        return DropdownMenuItem(
                                          child:  Text(value,style: TextStyle(
                                              color: HINT_COLOR
                                          ),),
                                          value: value,
                                        );
                                      }).toList(),
                                    )),
                                  ],),),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 35,child:
                                Obx(() =>  DropdownButton(
                                  isExpanded: true,
                                  isDense: true,
                                  underline: Container(),
                                  hint: Text(''),
                                  icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
                                  onChanged: (newValue) {
                                    signUpController.selectDayValue(int.parse(newValue.toString()));
                                  },
                                  value: signUpController.selectedDayValue.value,
                                  items: DAYS.map((selectedType) {
                                    return DropdownMenuItem(

                                      child:  Text("$selectedType",style: TextStyle(
                                          color: HINT_COLOR
                                      ),),
                                      value: selectedType,
                                    );
                                  }).toList(),
                                )),),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    height: 35,child:
                                  Obx(() =>  DropdownButton(
                                    isExpanded: true,
                                    isDense: true,
                                    icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
                                    underline: Container(),
                                    hint: Text(
                                      '',
                                    ),
                                    onChanged: (newValue) {
                                      signUpController.selectYearValue(int.parse(newValue.toString()));
                                    },
                                    value: signUpController.selectedYearValue.value,
                                    items: YEARS.map((value) {
                                      return DropdownMenuItem(
                                        child:  Text("$value",style: TextStyle(
                                            color: HINT_COLOR,fontSize: 12
                                        ),),
                                        value: value,
                                      );
                                    }).toList(),
                                  )),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin:EdgeInsets.symmetric(horizontal: 40),
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   height: 48,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.all(Radius.circular(8))
                        //   ),
                        //   child: CountryCodePicker(
                        //     onChanged: print,
                        //     initialSelection: 'IT',
                        //     favorite: ['+39','FR'],
                        //     showCountryOnly: true,
                        //     showOnlyCountryWhenClosed: true,
                        //     alignLeft: true,
                        //     textStyle: TextStyle(color: Colors.white),
                        //
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  //Gender
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset("assets/icons/ic_person.svg",height: 15,color: Colors.black,),
                            ),
                            Text("Gender",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,right: 35,left: 35,bottom: 15),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 12,width: 12,decoration: BoxDecoration(
                                  border: Border.all(color: HINT_COLOR,width: 2),
                                  shape: BoxShape.circle
                              ),),
                            ),
                            SvgPicture.asset("assets/icons/ic_male.svg",height: 25,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('Male',style: TextStyle(
                                  color: HINT_COLOR,
                                  fontSize: 12
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 12,width: 12,decoration: BoxDecoration(
                                  border: Border.all(color: HINT_COLOR,width: 2),
                                  shape: BoxShape.circle
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom:4.0),
                              child: SvgPicture.asset("assets/icons/ic_female.svg",height: 25,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text('Female',style: TextStyle(
                                  color: HINT_COLOR,
                                  fontSize: 12
                              ),),
                            ),
                          ],),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  //Nationality
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0,top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset("assets/icons/ic_nationality.svg",height: 22,color: Colors.black,),
                              ),
                              Text("Nationality",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35,right: 35,bottom: 20),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(7))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  hintText: "United arab Emirates",
                                  hintStyle: TextStyle(
                                      fontSize: 14
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  //Language
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0,top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset("assets/icons/ic_nationality.svg",height: 22,color: Colors.black,),
                              ),
                              Text("Languages",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(7))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Arabic",
                                  hintStyle: TextStyle(
                                      fontSize: 14
                                  )
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          width: double.infinity,
                          child: Text("+ Add new email",textAlign: TextAlign.end,style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  //Marital status
                  Container(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset("assets/icons/ic_marital_status.svg",height: 18,color: Colors.black,),
                            ),
                            Text("Marital status",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,right: 35,left: 35,bottom: 15),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 14,width: 14,decoration: BoxDecoration(
                                  border: Border.all(color: HINT_COLOR,width: 2),
                                  shape: BoxShape.circle
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('Married',style: TextStyle(
                                  color: HINT_COLOR,
                                  fontSize: 14
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 14,width: 14,decoration: BoxDecoration(
                                  border: Border.all(color: HINT_COLOR,width: 2),
                                  shape: BoxShape.circle
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text('Unmarried',style: TextStyle(
                                  color: HINT_COLOR,
                                  fontSize: 14
                              ),),
                            ),
                          ],),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  //Location
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0,top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset("assets/icons/ic_location.svg",height: 22,color: Colors.black,),
                              ),
                              Text("Location / Address",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35,right: 35,bottom: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(7))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "United arab Emirates",
                                  hintStyle: TextStyle(
                                      fontSize: 14
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                    child: MyButton(text: "Update", width: getWidth(context)*.5, background_color: Colors.black, border_radius: 8, hight: 55, text_color: Colors.white, text_size: 18),
                  )
                ],))
        ],),
    );
  }
}
