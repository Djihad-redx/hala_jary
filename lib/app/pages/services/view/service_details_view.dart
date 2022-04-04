import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hala_jary/app/pages/services/view/service_details_card.dart';

import '../../../utility/constants.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: BackButton(color: Colors.black,),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          width: double.infinity,decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8),),
            border: Border.all(color: Colors.black)
        ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search,color: Colors.black,),
            ),
            Text("Search",style: TextStyle(color: HINT_COLOR,fontSize: 13),)

          ],),
        ),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.notifications,color: Colors.black,)),
          IconButton(onPressed: (){
          }, icon: Icon(Icons.person,color: Colors.black,))
        ],
      ),
      body: ListView(children: [
        ServiceDetailCard(title: "Safa Electrical Company",picture: "im1.jpg",),
        ServiceDetailCard(title: "Orient Electrical Company",picture: "im3.jpg",),
        ServiceDetailCard(title: "Electrical & Communications Company",picture: "im2.jpg",),
      ],),
    );
  }
}


