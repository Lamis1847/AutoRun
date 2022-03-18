import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/inscription_page.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/delayed_animation.dart';
import 'package:flutterapp/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,),
              SizedBox(height: 5),
             DelayedAnimation(
                delay: 500,
                child: Container(
                  height: 170,
                  child: Image.asset('images/Welcome.png'),
                ),
              ),
                 
            SizedBox(height: 10),
              DelayedAnimation(
              delay: 700,
              child: Text(
                "Welcome to our application",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'NexaXRegular',
                  color: Color.fromRGBO(112, 112, 112,100),
                  fontSize: 20,
                ),
              ),
              
            ),
            
             SizedBox(height: 50),
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: 170,
                  child: Image.asset('images/bookcab.png'),
                ),
              ),
             
            SizedBox(height: 80),
            
            DelayedAnimation(
              delay: 1000,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Column(
                 
                  children: [
                    
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InscriptionPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                         shape: RoundedRectangleBorder( // <--- use this
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        primary: d_blue,
                        padding: EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          
                          Text(
                            'Sign up',
                            style: TextStyle(
                              fontFamily: 'NexaXRegular',
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder( // <--- use this
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          
                          ),
                        ),
                        primary: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.all(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Sign in',
                             style: TextStyle(
                              fontFamily: 'NexaXRegular',
                              color: d_blue,
                              fontSize: 22,
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              ),
              
            ),
            ],
          ),
        ),
      ),
    );
  }
}
