import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/inscription_page.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/delayed_animation.dart';
import 'package:flutterapp/welcome_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  alignment: Alignment.center,),
              SizedBox(height: 70),
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
                  height: 170,
                  child: SvgPicture.asset("images/Logo_FUTURA.svg"),
                ),
              ),
            ],
          ),
        )
        ),
    
    );
  }
}
