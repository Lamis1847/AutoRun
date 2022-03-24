import 'package:flutter/material.dart';
import 'package:AutoRun/logo_page.dart';
import 'package:AutoRun/welcome_page.dart';
import 'package:flutter/src/widgets/navigator.dart';


const d_blue = const Color(0xFF4361EE);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cars App',
      home: LogoPage(goToPage: WelcomePage(), duration: 5),
      
    );
  }
}


