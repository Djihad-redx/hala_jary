// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';

//Keys
const String NO_INTERNET = "Check internet please!";
const String CONNECTED_AGAIN = "Connected again!";
const String MAP_BOX_KEY = "pk.eyJ1IjoiZGppaGFkIiwiYSI6ImNsMGtqZWp6dzAxMnIzY3BsZ2l5a3N4cHgifQ.JGdHJ1QzC3DAfbFDbPV5WA";
const String MAP_BOX_STYLE = "https://api.mapbox.com/styles/v1/djihad/cl0kk14bz004215qgjvuvzmvq/tiles/256/{z}/{x}/{y}@2x?access_token=$MAP_BOX_KEY";
const String MAP_BOX_STYLE_GALAXY = "https://api.mapbox.com/styles/v1/djihad/cl0kqgkfm007714qb76ys7i63/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGppaGFkIiwiYSI6ImNsMGtqZWp6dzAxMnIzY3BsZ2l5a3N4cHgifQ.JGdHJ1QzC3DAfbFDbPV5WA";

//Colors
const Gradient BACKGROUND_COLOR = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1,1],
    colors: [Color(0xFFC7565C),Color(0xFFE08D4F)]
);
const Gradient BACKGROUND_COLOR2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2,1],
    colors: [Color(0xFFFEFEFD),Color(0xFFE7E0D8)]
);
const Gradient BACKGROUND_COLOR3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.3                                                                    ,1],
    colors: [Color(0xFFFEFEFD),COLOR_CHAT_BACKGROUND]
);
const Color HINT_COLOR = Color(0xFFBBBBBB);
const Color PRIMARY_COLOR = Color(0xFFF9F5F1);
const Color FACEBOOK_COLOR = Color(0xFF4064AC);
const Color SECONDARY_COLOR = Color(0xFFD57753);
const Color THIRD_COLOR = Color(0xFFE3D3C1);
const Color COLOR_1 = Color(0xFFC7565C);
const Color COLOR_2 = Color(0xFFE08D4F);
const Color COLOR_3 = Color(0xFFD67952);
const Color COLOR_CHAT = Color(0xFFDED4C8);
const Color COLOR_CHAT_BACKGROUND = Color(0xFFE6DFD7);
const Color SNACK_BAR_COLOR = Color(0xFFCB5E5B);
const Color BOTTOM_COLOR = Color(0xFFE8E1D9);

//Lists
const List<String> MONTHS = [' January', ' February', ' March ', ' April ',' May ',' June',' July',' August',' September',' October',' November',' December'];
const List<String> MY_HOBBIES = ['Gym', ' Fishing','swimming'];
const List<String> HOBBIES = [' swimming', ' Gym', ' Fishing ', ' Golf ','Cricket','Snooker',' Fishing','jogging',' Horses riding','Yoga',' Football',' BasketBall',' swimming', ' Gym', ' Fishing ', ' Golf ','Cricket','Snooker',' Fishing','jogging',' Horses riding','Yoga',' Football',' BasketBall',];
final YEARS = List<int>.generate(100, (i) => 2020-i);
final DAYS = List<int>.generate(31, (i) => 31-i);
const TERMS_CONDITION = "hello this is our terms and condition";


//Sizes
double getHight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);