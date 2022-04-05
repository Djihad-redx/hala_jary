import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderController extends GetxController{
  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

}