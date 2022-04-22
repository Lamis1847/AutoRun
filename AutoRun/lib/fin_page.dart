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
                  color:d_blue,
                  fontWeight: FontWeight.bold
                  ),
                  
                  ),
                   SizedBox(height: 5,),
                  Text("Colonel Mellah ", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 5,),
                  Text("Oued Smar", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  
                  )),
                   SizedBox(height: 5,),
                  Text("2 heures 30 min", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  
                  )),
                   SizedBox(height: 5,),
                  Text("15 km", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  
                  ),
                  ),
                  ],
                  )
                  )                  
                  ),
                
                  ],
                  )
                  ),
                  
                   Container(
                   margin: EdgeInsets.symmetric(
                   
                  horizontal: 15,),
                  height: 250,
                  child:Stack(
                  children: [
                  Positioned(
                  top: 30,
                  left: 20,
                   child: Material(
                  
                    child: Container(
                    height: 160.0,
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
                  ),
                  
                  ),
                  Positioned(
                  top: 55,
                  left:50,
                  child: Container(
                  height: 200,
                  width: 160,
                  child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                  Text("Reçu", style:TextStyle(
                  fontSize: 20,
                  color:d_blue,
                  fontWeight: FontWeight.bold
                  ),
                  
                  ),
                   SizedBox(height: 5,),
                  Text("Prix par heure 2000DA", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 5,),
                  Text("Prix HT             5000DA", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  
                  )),
                   SizedBox(height: 5,),
                  Text("TVA(5%)           250DA", style:TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.bold
                  
                  )),
                   SizedBox(height: 5,),
                  Text("Prix TTC           5250DA", style:TextStyle(
                  fontSize: 14,
                  color:d_blue,
                  fontWeight: FontWeight.bold
                  
                  ),
                  ),
                  ],
                  )
                  )                  
                  ),],
                  )
                  ),
             
             const SizedBox(height: 2),
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
