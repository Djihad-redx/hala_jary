import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hala_jary/app/widgets/back_button_widget.dart';

import '../../../utility/constants.dart';
import '../../../widgets/background_widget.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidget(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: MyBackButton()),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                  child: ListView(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 20),
                        child: Text("TERMS & CONDITION",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(TERMS_CONDITION,style: TextStyle(
                          color: Colors.white
                        ),),
                      )
                  ],),
                ),
              ),
            ],
          )),
    );
  }
}

