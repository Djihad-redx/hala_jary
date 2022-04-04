import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'group_card.dart';

class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        GroupCard(imag: "g1.jpeg",groupName: "Group Name 1",),
        GroupCard(imag: "g2.jpg",groupName: "Group Name 2",),
        GroupCard(imag: "g3.jpg",groupName: "Group Name 3",),
        GroupCard(imag: "g4.jpg",groupName: "Group Name 4",),
        GroupCard(imag: "g1.jpeg",groupName: "Group Name 5",),

      ],),
    );
  }
}

