import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';


class IconTextTitle extends StatelessWidget {
  String title;
  IconData? icon;
  bool? showIcon ;
  Color? iconColor;
  IconTextTitle({Key? key, required this.title, this.icon = Icons.star, this.iconColor , this.showIcon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${title}", style: Styles.headLine3Style),
        Gap(Applayout.getHeight(3)),
        Visibility( visible: showIcon ?? true, child: SizedBox(
          height: Applayout.getHeight(10),
          width: Applayout.getWidth(10),
          child:
          Image.asset('assets/images/asterisk.png',),
          // Icon(icon ,color: iconColor ?? Styles.orangeColor, size: 13,)
        ),),
      ],
    );
  }
}