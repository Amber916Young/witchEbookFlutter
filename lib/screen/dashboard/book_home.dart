import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witchbook/utils/app_layout.dart';

import '../../widgets/table/data_table_widget.dart';

class BookManageHomeScreen extends StatefulWidget {
  const BookManageHomeScreen({Key? key}) : super(key: key);

  @override
  _BookManageHomeScreenState createState() => _BookManageHomeScreenState();
}

class _BookManageHomeScreenState extends State<BookManageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(Applayout.getHeight(16)),
      child: DataTablePage(),
    );
  }
}
