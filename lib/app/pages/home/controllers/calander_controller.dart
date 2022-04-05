import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/global.dart';

class CalenderController extends GetxController{
  late final ValueNotifier<List<Event>> selectedEvents;
  var focusedDayy = ValueNotifier(DateTime.now()).obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;
  var rangeSelectionMode = RangeSelectionMode.toggledOff.obs;
  Rx<DateTime>? rangeStart = DateTime.now().obs;
  Rx<DateTime>? rangeEnd = DateTime.now().obs;

  @override
  void onInit() {
    //selectedDays.value.add(focusedDayy.value.value);
    selectedEvents = ValueNotifier(getEventsForDay(focusedDayy.value.value));
    super.onInit();
  }
  @override
  void onClose() {
    focusedDayy.value.dispose();
    selectedEvents.dispose();
    super.onClose();
  }

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return getEventsForDays(days);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {

      focusedDayy.value.value = focusedDay;
      rangeStart = null;
      rangeEnd = null;
      rangeSelectionMode.value = RangeSelectionMode.toggledOff;


//    selectedEvents.value = getEventsForDays(selectedDay);
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {

      focusedDayy.value.value = focusedDay;
      rangeStart?.value = start!;
      rangeEnd?.value = end!;
   //   selectedDays.value.clear();
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;


    if (start != null && end != null) {
      selectedEvents.value = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents.value = getEventsForDay(end);
    }
  }

}