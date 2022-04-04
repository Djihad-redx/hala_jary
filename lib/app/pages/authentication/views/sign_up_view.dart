
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/controller/sign_up_controller.dart';
import 'package:hala_jary/app/pages/authentication/views/pick_adress_view.dart';
import 'package:hala_jary/app/pages/authentication/views/terms_&_conditions_view.dart';
import 'package:hala_jary/app/widgets/input_field.dart';
import 'package:hala_jary/app/widgets/my_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../utility/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUp extends GetView {

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final SignUpController signUpController = Get.put(SignUpController());
    String initialCountry = 'DZ';
    PhoneNumber number = PhoneNumber(isoCode: 'DZ');
    return Scaffold(body: Container(

      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
          gradient: BACKGROUND_COLOR
      ),
      child: ListView(
        children: [
        Column(
          children: [
          SizedBox(height: getHight(context)*.03,),
            Container(child: Image(
              image: AssetImage("assets/icons/logo.png",),
              height: getHight(context)*.14,
            ),),
            SizedBox(height: getHight(context)*.01,),
          Text('CREATE NEW ACCOUNT',style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: getHight(context)*.03,),
          Container(
            padding: EdgeInsets.only(left: 40,right: 30),
            child: Row(children: [
              Flexible(child: InputField(hint: "First name", icon: "ic_person",divider: true,)),
              Flexible(child: Container(margin:EdgeInsets.only(left: 10,right: 10),child: InputField(hint: "Last name", icon: "",divider: false,)))
            ],),
          ),
          SizedBox(height: getHight(context)*.02,),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              inputBorder: InputBorder.none,
              ignoreBlank: true,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
             // initialValue: number,
              textFieldController: controller,
              hintText: "581019255",
              formatInput: false,
              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
              onSaved: (PhoneNumber numberr) {
                print('On Saved: $number');
              //  number = numberr;
              },
            ),
          ),
          SizedBox(height: getHight(context)*.02,),
          Container(
              margin:EdgeInsets.symmetric(horizontal: 40),
              child: InputField(hint: "Email", icon: "ic_Email",divider: true,)),
          SizedBox(height: getHight(context)*.02,),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 40),
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Row(children: [
              Container(
                width: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 6),
                  child: SvgPicture.asset("assets/icons/ic_person.svg",height: 20,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset("assets/icons/ic_divider.svg",height: 40,),
              ) ,
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
            ],),),
          // SizedBox(height: 20,),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 35),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 5,
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.all(Radius.circular(8))
          //           ),
          //           margin: EdgeInsets.symmetric(horizontal: 5),
          //           height: 48,
          //           child: Row(children: [
          //           Container(
          //             width: 40,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 12.0,right: 6),
          //               child: SvgPicture.asset("assets/icons/ic_date.svg",height: 20),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(6.0),
          //             child: SvgPicture.asset("assets/icons/ic_divider.svg",height: 40,),
          //           ),
          //             Obx(() =>  DropdownButton(
          //               underline: Container(),
          //               icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
          //               onChanged: (newValue) {signUpController.selectMonthValue(newValue!.toString());},
          //               value: signUpController.selectedMonthValue.value,
          //               items: MONTHS.map((value) {
          //                 return DropdownMenuItem(
          //                   child:  Text(value,style: TextStyle(
          //                     color: HINT_COLOR
          //                   ),),
          //                   value: value,
          //                 );
          //               }).toList(),
          //             )),
          //         ],),),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: Container(
          //           padding: EdgeInsets.all(5),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.all(Radius.circular(8))
          //           ),
          //           margin: EdgeInsets.symmetric(horizontal: 5),
          //           height: 48,child:
          //           Obx(() =>  DropdownButton(
          //           underline: Container(),
          //           hint: Text(''),
          //             icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
          //           onChanged: (newValue) {
          //             signUpController.selectDayValue(int.parse(newValue.toString()));
          //           },
          //           value: signUpController.selectedDayValue.value,
          //           items: DAYS.map((selectedType) {
          //             return DropdownMenuItem(
          //               child:  Text("$selectedType",style: TextStyle(
          //                   color: HINT_COLOR
          //               ),),
          //               value: selectedType,
          //             );
          //           }).toList(),
          //         )),),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: Container(
          //           padding: EdgeInsets.all(5),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.all(Radius.circular(8))
          //           ),
          //           margin: EdgeInsets.symmetric(horizontal: 5),
          //           height: 48,child:
          //         Obx(() =>  DropdownButton(
          //           icon: Icon(Icons.arrow_drop_down,color: HINT_COLOR,),
          //           underline: Container(),
          //           hint: Text(
          //             '',
          //           ),
          //           onChanged: (newValue) {
          //             signUpController.selectYearValue(int.parse(newValue.toString()));
          //           },
          //           value: signUpController.selectedYearValue.value,
          //           items: YEARS.map((value) {
          //             return DropdownMenuItem(
          //               child:  Text("$value",style: TextStyle(
          //                   color: HINT_COLOR,fontSize: 12
          //               ),),
          //               value: value,
          //             );
          //           }).toList(),
          //         )),),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 20,),
          //   Container(
          //     margin:EdgeInsets.symmetric(horizontal: 40),
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     height: 48,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(8))
          //     ),
          //     child: CountryCodePicker(
          //       onChanged: print,
          //       initialSelection: 'IT',
          //       favorite: ['+39','FR'],
          //       showCountryOnly: true,
          //       showOnlyCountryWhenClosed: true,
          //       alignLeft: true,
          //       textStyle: TextStyle(color: Colors.white),
          //
          //     ),
          //   ),
            SizedBox(height: getHight(context)*.02,),
          InkWell(
            onTap: (){
              Get.to(PickAdressView());
            },
            child: Container(
                margin:EdgeInsets.symmetric(horizontal: 40),
                child: InputField(hint: "Select your location",
                  icon: "ic_location",divider: true,)
            ),
          ),
          // SizedBox(height: 20,),
          // Container(
          //     margin:EdgeInsets.symmetric(horizontal: 40),
          //     child: InputField(hint: "Profession", icon: "ic_preffission",divider: true,)),
          // SizedBox(height: 20,),
          // Container(
          //     margin:EdgeInsets.symmetric(horizontal: 40),
          //     child: InputField(hint: "Hobbies/interests", icon: "ic_hobbies",divider: true,)),
          SizedBox(height: getHight(context)*.02,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: CheckboxListTile(
                title: InkWell(
                  onTap: (){
                    Get.to(TermsConditionsView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("I agree to the terms & conditions and the privacy policy",style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),),
                  ),
                ),
                value: true,
                onChanged: (newValue) {

                },
                checkColor: Colors.black,
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
            ),
            SizedBox(height: getHight(context)*.02,),
            Container(margin:EdgeInsets.symmetric(horizontal: 40),child: MyButton(text: "SIGN UP", width: MediaQuery.of(context).size.width, background_color: Colors.black, border_radius: 10, hight: 60, text_color: Colors.white, text_size: 17)),
            SizedBox(height: getHight(context)*.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Already have an account?',style: TextStyle(
                color: Colors.white,
                fontSize: 13
              ),),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('SignIn',style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],),
            SizedBox(height: getHight(context)*.03,),
        ],)
      ],),
    ),);
  }
}
