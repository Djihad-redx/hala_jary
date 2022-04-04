import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class MyMarker extends StatelessWidget {
  const MyMarker({
    Key? key,
    this.id,
    this.picture,
    this.callback,
  }) : super(key: key);

  final int? id;
  final String? picture;
  final Function()? callback;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.location_on_rounded,size: 70,color: id == 1? Colors.red[400]:Colors.teal[400],)),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 7),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(picture!),fit: BoxFit.cover
                    )
                ),),
            )
          ],
        ),
      ),
    );
  }
}