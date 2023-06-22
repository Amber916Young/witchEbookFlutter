import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../utils/app_layout.dart';
import '../utils/my_box.dart';
import '../utils/my_tile.dart';
import '../widgets/reading_card_list.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.displayMedium,
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
                  SizedBox(height: 30),
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
                          image: "assets/images/book-2.png",
                          title: "Top Ten Business Hacks",
                          auth: "Herman Joel",
                          rating: 4.8, pressDetails: (){},
                          pressRead: (){},
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       // first 4 boxes in grid
      //       AspectRatio(
      //         aspectRatio: 1,
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: GridView.builder(
      //             itemCount: 4,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2),
      //             itemBuilder: (context, index) {
      //               return MyBox();
      //             },
      //           ),
      //         ),
      //       ),
      //
      //       // list of previous days
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: 4,
      //           itemBuilder: (context, index) {
      //             return const MyTile();
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
