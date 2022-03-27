import 'package:flutter/material.dart';
import 'inscription_page.dart';
import 'main.dart';
import 'delayed_animation.dart';
import 'welcome_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;
  LogoPage({required this.goToPage, required this.duration});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 30,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            DelayedAnimation(
              delay: 1500,
              child: Container(
                height: 230,
                child: SvgPicture.asset("images/AutoRun_logo.svg"),
              ),
            ),
            SizedBox(height: 150),
            DelayedAnimation(
              delay: 1500,
              child: Container(
                height: 150,
                child: SvgPicture.asset("images/Logo_FUTURA.svg"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
