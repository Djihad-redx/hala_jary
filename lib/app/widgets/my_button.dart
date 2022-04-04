import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
    required this.width,
    required this.background_color,
    required this.border_radius,
    required this.hight,
    required this.text_color,
    required this.text_size
  }) : super(key: key);

  final double? text_size;
  final String? text;
  final double? hight;
  final double? width;
  final Color? background_color;
  final Color? text_color;
  final int? border_radius;

  @override
  Widget build(BuildContext context) {
    return Container(height: hight,width: width,decoration:
    BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: background_color
    ),child: Center(child: Text(text!,style: TextStyle(
        color: text_color,
        fontSize: text_size,
        fontWeight: FontWeight.bold
    ),),),);
  }
}