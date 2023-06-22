
import 'package:flutter/material.dart';
import 'package:witchbook/utils/app_layout.dart';
import 'package:witchbook/utils/app_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Applayout.getWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.headLine3Style,),
        ],
      ),
    );
  }
}
