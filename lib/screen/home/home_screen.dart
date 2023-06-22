import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:witchbook/model/book_model.dart';

import '../../model/category_model.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';
import '../../widgets/header/gradient_appBar.dart';
import '../../widgets/header/section_title.dart';
import '../../widgets/reading_card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final size = Applayout.getSize(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GrandientAppBar(
        showAvatar: false,
        onNavigate: () {},
        title: Styles.menu1_cn,
        showBack: false,
        onPressback: () {
          // CustomNavigator.back(context);
        },
      ),
      body: SingleChildScrollView(
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
                    padding:  EdgeInsets.symmetric(horizontal:  Applayout.getHeight(10)),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                              text: "今天，",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: "读什么书呢？"),

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

                  SectionTitle(title:"分类"),
                  Gap( Applayout.getHeight(20)),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CateSection extends StatelessWidget {
  final CategoryModel category;

  const CateSection({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: category.books?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        BookModel bookModel = category.books![index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: Container()
          // BookListItem(entry: bookModel),
        );
      },
    );
  }
}
