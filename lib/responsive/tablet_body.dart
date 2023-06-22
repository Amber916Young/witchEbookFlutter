import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_constants.dart';
import '../utils/app_layout.dart';
import '../utils/my_box.dart';
import '../utils/my_tile.dart';
import '../widgets/reading_card_list.dart';


class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    final size = Applayout.getSize(context);

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Applayout.getHeight(size.width),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/main_page_bg.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap( Applayout.getHeight(30)),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Applayout.getHeight(10)),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                          TextSpan(text: "What are you \nreading "),
                          TextSpan(
                              text: "today?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Gap( Applayout.getHeight(30)),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ReadingListCard(
                          image: "assets/images/book-1.png",
                          title: "Crushing & Influence",
                          auth: "Gary Venchuk",
                          rating: 4.9,
                          pressDetails: () {
                          },
                          pressRead: (){},

                        ),
                        ReadingListCard(
                          image: "assets/images/book-1.png",
                          title: "Crushing & Influence",
                          auth: "Gary Venchuk",
                          rating: 4.9,
                          pressDetails: () {
                          },
                          pressRead: (){},

                        ),   ReadingListCard(
                          image: "assets/images/book-1.png",
                          title: "Crushing & Influence",
                          auth: "Gary Venchuk",
                          rating: 4.9,
                          pressDetails: () {
                          },
                          pressRead: (){},

                        ),   ReadingListCard(
                          image: "assets/images/book-1.png",
                          title: "Crushing & Influence",
                          auth: "Gary Venchuk",
                          rating: 4.9,
                          pressDetails: () {
                          },
                          pressRead: (){},

                        ),
                        ReadingListCard(
                          image: "assets/images/book-2.png",
                          title: "Top Ten Business Hacks",
                          auth: "Herman Joel",
                          rating: 4.8, pressDetails: (){},
                          pressRead: (){},
                        ),
                        Gap( Applayout.getHeight(30)),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
