import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hala_jary/app/pages/services/view/service_details_view.dart';
import 'package:hala_jary/app/pages/services/view/services_card.dart';
import 'package:hala_jary/app/utility/constants.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ServicesCard(icon: "ic_service01",members: 25,serviceName: "Electrician"),
        ServicesCard(icon: "ic_service01",members: 10,serviceName: "Plumber",),
        ServicesCard(icon: "ic_service01",members: 15,serviceName: "Home cleaner",),
        ServicesCard(icon: "ic_service01",members: 25,serviceName: "AC Technician",),
        ServicesCard(icon: "ic_service01",members: 30,serviceName: "Home security",),
        ServicesCard(icon: "ic_service01",members: 2,serviceName: "plumber",),
        ServicesCard(icon: "ic_service01",members: 25,serviceName: "AC Technician",),
        ServicesCard(icon: "ic_service01",members: 30,serviceName: "Home security",),
        ServicesCard(icon: "ic_service01",members: 2,serviceName: "plumber",),
      ],),
    );
  }
}


