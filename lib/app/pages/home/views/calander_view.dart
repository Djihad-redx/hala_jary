import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/home/controllers/calander_controller.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/global.dart';
class CalenderView extends GetView {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalenderController());
    return Scaffold(
      body: Container(
        color: COLOR_CHAT_BACKGROUND.withOpacity(0.4),
        height: getHight(context),
        width: getWidth(context),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Obx(()=>  TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: controller.focusedDay.value,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                  //  shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(color: COLOR_2,width:4),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  cellMargin: EdgeInsets.all(8),
                  canMarkersOverflow: false,
                  selectedTextStyle: TextStyle(color: Colors.black),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white
                  ),
                  markerDecoration: BoxDecoration(
                    color: COLOR_2
                  ),
                  markerMargin: EdgeInsets.only(top: 10),
                  todayDecoration: BoxDecoration(
                    color: COLOR_2,
                   borderRadius: BorderRadius.all(Radius.circular(5))
                   // shape: BoxShape.circle
                  ),
                  weekendDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )

                ),
                headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                      titleCentered: true,
                      leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,),
                      rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,),
                      formatButtonVisible: false,
                      headerMargin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: COLOR_2,
                          image: DecorationImage(
                              image: AssetImage("assets/images/background_calender.png"),
                              fit: BoxFit.cover
                          ),
                         borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(5))
                      )),
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
               // rangeStartDay: controller.rangeStart?.value,
               // rangeEndDay: controller.rangeEnd?.value,
                calendarFormat: controller.calendarFormat.value,
                rangeSelectionMode: controller.rangeSelectionMode.value,
                eventLoader: controller.getEventsForDay,

                // holidayPredicate: (day) {
                //   return day.day == 4;
                // },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(controller.selectedDay.value, selectedDay)) {
                    controller.selectedDay.value = selectedDay;
                    controller.focusedDay.value = focusedDay;
                  }
                },
                onRangeSelected: controller.onRangeSelected,
              //  onCalendarCreated: controller.initController,
                onPageChanged: (focusedDay) => controller.focusedDayy.value.value = focusedDay,
                onFormatChanged: (format) {
                  if (controller.calendarFormat != format) {
                    controller.calendarFormat.value = format;
                  }
                },
              ),),
            ),
            Obx(()=>controller.calendarFormat.value == CalendarFormat.month?
            GestureDetector(
              onVerticalDragEnd: (_){
                controller.calendarFormat.value = CalendarFormat.week;
              },
              child:  Container(
                height: 55,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 25,top: 12),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Today",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("3 Activities",style: TextStyle(
                              fontSize: 16
                          ),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text("See all"),
                    )
                  ],
                ),
              ),
            ):
            GestureDetector(
              onVerticalDragEnd: (_){
                controller.calendarFormat.value = CalendarFormat.month;
              },
              child:  Container(
                height: 60,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 25,top: 12),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Today",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("3 Activities",style: TextStyle(
                              fontSize: 16
                          ),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text("See all"),
                    )
                  ],
                ),
              ),
            ),) ,
            Expanded(child: ListView.builder(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 50),
              itemCount: 3,
              itemBuilder: (context, index) => Container(child:
               Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text("8:30 PM",style: TextStyle(
                      fontSize: 15,

                    ),),
                  ),
                  Container(
                    height: 55,
                    margin: EdgeInsets.all(5),
                    color: COLOR_1,width: 4,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("sit amet, consectetur adipiscing elit amet.Lorem ipsum dolor sit amet, consectetur elit.",style: TextStyle(
                          fontSize: 11,
                        ),maxLines: 3,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),                          child: Text("8:30 PM - 9:30 PM",style: TextStyle(
                              fontSize: 12,
                              color: HINT_COLOR
                            ),),
                          )

                      ],),
                    ),
                  )
                ],),
                Divider(color: Colors.grey.shade400,thickness: 3,)
              ],
            )),),)
      ],),),
    );
  }
}
