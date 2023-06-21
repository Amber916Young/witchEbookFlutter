import 'package:flutter/material.dart';
import 'package:witchbook/screen/home/home_screen.dart';
import 'package:witchbook/widgets/rounded_button.dart';

import 'commom/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Styles.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: Styles.primaryColor,
        ),
      ),
      home : WelcomeScreen(),
    );
  }
}
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayMedium,
                children: [
                  TextSpan(
                    text: Styles.appName,
                  ),
                  TextSpan(
                    text: "go.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                fontSize: 20,
                press: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
