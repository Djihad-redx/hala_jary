import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../utility/constants.dart';
import '../../../widgets/my_button.dart';

class MyInterests extends GetView {

  @override
  Widget build(BuildContext context) {
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
                  child: Text("My interests",style: TextStyle(
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
                              child: SvgPicture.asset("assets/icons/ic_hobbies.svg",height: 22,color: Colors.black,),
                            ),
                            Text("Hobbies",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),)
                          ],
                        ),
                        SizedBox(height: 20,),
                       ],
                     ),
                   ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: MultiSelectChipDisplay(
                      chipColor: Colors.grey.shade200,
                      textStyle: TextStyle(color: Colors.black),
                      items: MY_HOBBIES.map((e) => MultiSelectItem(e, e)).toList(),
                      onTap: (value) {
                        //  _selectedAnimals.remove(value);
                      },
                    ),
                  ),
                  SizedBox(height: getHight(context)*.05,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: MultiSelectChipDisplay(
                      chipColor: Colors.grey.shade300,
                      textStyle: TextStyle(color: Colors.black),
                      items: HOBBIES.map((e) => MultiSelectItem(e, e)).toList(),
                      onTap: (value) {
                        //  _selectedAnimals.remove(value);
                      },
                    ),
                  ),
                  SizedBox(height: getHight(context)*.02,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                    child: MyButton(text: "Update", width: getWidth(context)*.5, background_color: Colors.black, border_radius: 8, hight: 55, text_color: Colors.white, text_size: 18),
                  )
                ],))
        ],),
    );
  }
}
