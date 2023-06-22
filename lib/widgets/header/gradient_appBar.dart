import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';


PreferredSizeWidget GrandientAppBar({
  required String title,
  required Function onPressback,
  required bool showBack,
  bool? showAvatar = false,
  bool? showExist = false,
  required Function onNavigate,
  bool? showClock = false,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: showBack ? IconButton(
        color:Styles.whiteColor,
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onPressback();
      },
    ): null,
    centerTitle: true,
    title: Text(
      title,
      style: Styles.headLine2Style.copyWith(color: Styles.whiteColor),
      textAlign: TextAlign.center,
    ),
    flexibleSpace:  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Styles.mainColor1,
            Styles.mainColor2,
            Styles.mainColor3
          ],
        ),
      ),

    ),
    actions: [

      Visibility(
        visible: showAvatar ?? false,
        child: InkWell(
            onTap: () {
              onNavigate();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Applayout.getWidth(5),
                  vertical: Applayout.getWidth(5)),
              height: Applayout.getHeight(50),
              width: Applayout.getWidth(50),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Styles.mainColor1),
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          "https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpg")
                  )
              ),)
        ),
      ),

      Visibility(
        visible: showExist ?? false,
        child: InkWell(
            onTap: () {
              onNavigate();
            },
            child:Icon(Icons.exit_to_app_rounded, size: 35,
              color: Styles.whiteColor,),
        ),
      ),

    ],

  );
}