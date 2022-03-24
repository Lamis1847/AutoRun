import 'package:flutter/material.dart';
import 'package:AutoRun/inscription_page.dart';
import 'package:AutoRun/main.dart';
import 'package:AutoRun/delayed_animation.dart';
import 'package:AutoRun/login_page.dart';




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
              
              SizedBox(height: 5),
             DelayedAnimation(
                delay: 500,
                child: Container(
                  height: 100,
                  child: Image.asset('images/Bienvenue.png'),
                ),
              ),
                 
            SizedBox(height: 7),
              DelayedAnimation(
              delay: 700,
              child: Text(
                "Bienvenue dans AutoRun",
                textAlign: TextAlign.center,
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
                  height: 130,
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
                            "S'inscrire",
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
                            'Se connecter',
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
