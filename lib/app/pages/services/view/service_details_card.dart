import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class ServiceDetailCard extends StatelessWidget {
  const ServiceDetailCard({
    Key? key,
    required this.picture,
    required this.title,
  }) : super(key: key);
  final String? title;
  final String? picture;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image(image: AssetImage('assets/images/$picture'),height: 200,fit: BoxFit.cover,width: double.infinity,),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(title!,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("Electrician"))),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),

                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("AC technician"))),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("Electrician"))),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),

                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("AC technician"))),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("Electrician"))),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Center(child: Text("AC technician"))),
              ],),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset("assets/icons/ic_call.svg",height: 35,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset("assets/icons/ic_send_message.svg",height: 35,),
                    ),
                  ],),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: RatingBar.builder(
                    itemSize: 25,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 4,
                    itemPadding: EdgeInsets.symmetric(horizontal:0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),);
  }
}