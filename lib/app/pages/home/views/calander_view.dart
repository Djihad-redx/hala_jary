import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/home/controllers/calander_controller.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:table_calendar/table_calendar.dart';
class CalenderView extends GetView {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalenderController());
    return Scaffold(
      body: Container(
        color: COLOR_CHAT_BACKGROUND.withOpacity(0.4),
        child: Column(
          children: [
            // Container(
            //   height: 80,
            //   width: getWidth(context),
            //   decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/background_calender.png"),
            //     fit: BoxFit.cover
            //   )
            // ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal:18.0),
            //       child: Text("Calender",style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 22,
            //       )),
            //     ),
            //   ],
            // ),
            // ),
            Container(

              decoration: BoxDecoration(
              //  borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              margin: EdgeInsets.only(left: 0,right: 0,top: 0),
              child: Obx(()=>  TableCalendar(
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                      border: Border.all(color: COLOR_2,width:4),
                  ),
                  canMarkersOverflow: false,
                  selectedTextStyle: TextStyle(color: Colors.black),

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
                   )
                   // borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8))

                  )
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(
                    color: Colors.white
                  )
                ),
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: controller.focusedDay.value,
                calendarFormat: controller.calendarFormat.value,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(controller.selectedDay.value, selectedDay)) {
                    controller.selectedDay.value = selectedDay;
                    controller.focusedDay.value = focusedDay;
                  }
                },
                onFormatChanged: (format) {
                  if (controller.calendarFormat.value != format) {
                    controller.calendarFormat.value = format;
                  }
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay.value = focusedDay;
                },
              )),
            ),
            Container(
              height: 60,
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
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
                  ],),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("See all"),
                  )
                ],
              ),
            ),
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
