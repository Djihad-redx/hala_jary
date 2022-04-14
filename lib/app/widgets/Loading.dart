import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../utility/constants.dart';


class Loading extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(0),
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                color: PRIMARY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCubeGrid(
                  size: 60,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.black : Colors.black,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Loading..",style: TextStyle(
                    fontSize: 17
                  ),),
                )
              ],
            ),
          ),
        ));
  }
}