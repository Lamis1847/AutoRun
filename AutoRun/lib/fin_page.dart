import 'dart:ui';

import 'package:AutoRun/welcome_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'delayed_animation.dart';
import 'selfie_page.dart 'as selfi;
class FinalPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 5,
          ),
          child: Column(
            children: [
              
              const SizedBox(height: 30),
              DelayedAnimation(
                delay: 500,
                
                child: SizedBox(
                
                  height: 80,
                  child: Image.asset('images/BravoArrive.png'),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
              ),
              const DelayedAnimation(
                delay: 700,
               
                child: Text(
                  "Votre trajet",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'NexaBold',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                   
                  horizontal: 15,),
                  height: 238,
                  
                  child:Stack(
                  children: [
                  Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                  
                    child: Container(
                    height: 188.0,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(
                        -10.0, 10.0
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 4.0,
                    ),],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                   
                    ),
                    ),
                  )),
                  Positioned(
                  top:0,
                  left:30,
                  child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10.0),
                    color: Color(0xFF4361EE),
                    image: DecorationImage(
                   
                    image:AssetImage("images/Audi.png"),
                    ),
                    )
                  )
                  )
                  ),
                  Positioned(
                  top: 60,
                  left:200,
                  child: Container(
                  height: 150,
                  width: 160,
                  child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                  Text("Audi R8", style:TextStyle(
                  fontSize: 20,
                  color:Color(0xFF363f93),
                  fontWeight: FontWeight.bold
                  ),
                  
                  ),
                   SizedBox(height: 5,),
                  Text("Colonel Mellah ", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.normal
                  )),
                  SizedBox(height: 5,),
                  Text("Oued Smar", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.normal
                  
                  )),
                   SizedBox(height: 5,),
                  Text("2 heures 30 min", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.normal
                  
                  )),
                   SizedBox(height: 5,),
                  Text("5000 DA", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.normal
                  
                  ),
                  ),
                  ],
                  )
                  )
                  )
                  ],
                  )
                  ),
              /*DelayedAnimation(
                delay: 1000,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   Container(
                   margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                    
                  ),
                     color: Colors.white,
                     child: Text("Audi R8", textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'NexaBold',
                        color: Colors.black,
                        fontSize: 22,
                      ),
                     ),
                     
                                          
                   ),
                  
                   Container(
                      margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                  ),
                     color: Colors.white,
                      height: 50,
                      child: Image.asset('images/Audi.png'),
                      
                   ),
                  
                   Container(
                      margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                  ),
                     color: Colors.white,
                     child: Text("Av. Colonel Mellah Ali, Algiers 16000\n", textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'NexaBold',
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                      ),
                     
                   ),
                   Container(
                      margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                  ),
                     color: Colors.white,
                     child: Text("Oued Smar, Algiers 16000\n", textAlign: TextAlign.left,
                     style: TextStyle(
                        fontFamily: 'NexaBold',
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                      ),
                     
                   ),
                   Container(
                      margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                  ),
                     color: Colors.white,
                     child: Text("2 heures 30 minutes\n", textAlign: TextAlign.left,
                     style: TextStyle(
                        fontFamily: 'NexaBold',
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                      ),
                     
                   ),
                   Container(
                      margin: EdgeInsets.symmetric(
                   
                    horizontal: 30,
                  ),
                     color: Colors.white,
                     child: Text("5000 DA\n", textAlign: TextAlign.left,
                     style: TextStyle(
                        fontFamily: 'NexaBold', 
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                      ),
                     
                   ),
                 ],
                ),
              // ),*/
             const SizedBox(height: 85),
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: ()  {
                          
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomePage(),
                            ),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            // <--- use this
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          primary: d_blue,
                          padding: const EdgeInsets.all(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              "Terminer",
                              style: TextStyle(
                                fontFamily: 'NexaXRegular',
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            )
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
