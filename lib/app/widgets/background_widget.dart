import 'package:flutter/cupertino.dart';

import '../utility/constants.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    Key? key,
    this.child,
    this.padding
  }) : super(key: key);

  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: BACKGROUND_COLOR,
      ),
      child: child,
    );
  }
}