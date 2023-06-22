import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:witchbook/utils/app_layout.dart';

import '../../utils/app_styles.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key, required SidebarXController controller}) : _controller = controller,super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme:   SidebarXTheme(
        decoration: BoxDecoration(
            color: Styles.inactiveColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular( Applayout.getHeight(20)),bottomRight: Radius.circular(Applayout.getHeight(20)))
        ),
        iconTheme: IconThemeData(
          color: Styles.whiteColor,
        ),
        selectedTextStyle:  TextStyle(color: Colors.white),
      ),
      extendedTheme:  SidebarXTheme(
          width: Applayout.getHeight(250)
      ),
      footerDivider: Divider(color:  Styles.whiteColor.withOpacity(0.8), height: 1),
      headerBuilder: (context,extended){
        return   SizedBox(
          height:  Applayout.getHeight(100),
          child: Icon(Icons.person,size: Applayout.getHeight(60),color: Styles.whiteColor,),
        );
      },
      items:  [
        SidebarXItem(icon: Icons.home, label: Styles.menu1_cn,),
        SidebarXItem(icon: Icons.search, label: Styles.menu2_cn),
        SidebarXItem(icon: Icons.settings, label: Styles.menu1_cn),
        SidebarXItem(icon: Icons.dark_mode, label: Styles.menu1_cn),
      ],
    );
  }
}