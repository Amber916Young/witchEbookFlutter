import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../screen/dashboard/book_form_add_screen.dart';
import '../screen/dashboard/book_home.dart';
import '../utils/app_constants.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../utils/my_box.dart';
import '../utils/my_tile.dart';
import '../widgets/header/gradient_appBar.dart';
import '../widgets/menu/draw_menu.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: null,
      drawer: SideBarMenu(controller: _controller,),
      body:Row(
        children: [
          SideBarMenu(controller: _controller,),

          Expanded(child: Center(child: AnimatedBuilder(
            animation: _controller,
            builder: (context,child){
              switch(_controller.selectedIndex){
                case 0: _key.currentState?.closeDrawer();
                return BookManageHomeScreen();
                case 1: _key.currentState?.closeDrawer();
                return Padding(
                    padding:  EdgeInsets.all(Applayout.getHeight(16)),child: AddBookFormScreen());
                case 2: _key.currentState?.closeDrawer();
                return Center(
                  child: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 40),),
                );
                case 3: _key.currentState?.closeDrawer();
                return Center(
                  child: Text('Theme',style: TextStyle(color: Colors.white,fontSize: 40),),
                );
                default:
                  return Center(
                    child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 40),),
                  );
              }
            },
          ),))
        ],
      ),
    );
  }
}
