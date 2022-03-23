import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:AutoRun/delayed_animation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:AutoRun/Attente.dart';



class GalleryPage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
Uint8List? imageBytes;





  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(

       child: Center(
        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex:1,),
            Container(
            height:(MediaQuery.of(context).size.height)/2,
                width:(MediaQuery.of(context).size.width)/2,
            child:buildImage(),
            ),
      DelayedAnimation(
        delay: 6000,
            child:ElevatedButton(


                onPressed: (){pickImage();},

                style:ElevatedButton.styleFrom(primary:Color(0xFF4361EE),padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 15),
                    shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0))),


                child:const Text("Joindre une photo de galerie",
                    textAlign:TextAlign.center,
                    style:TextStyle(
                      fontSize:19.0,

                      letterSpacing: 2.0,
                      color:Color(0xFFFFFFFF),
                      fontFamily: 'NexaBold',

                    )
                )
            ),),
           SizedBox(height: 20,),
           DelayedAnimation(
        delay: 6000,
            child:ElevatedButton(


                onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaitingPage(),
                      ),
                    );},

                style:ElevatedButton.styleFrom(primary:Color(0xFF4361EE),padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 15),
                    shape:new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0))),


                child:const Text("Terminer",
                    textAlign:TextAlign.center,
                    style:TextStyle(
                      fontSize:19.0,

                      letterSpacing: 2.0,
                      color:Color(0xFFFFFFFF),
                      fontFamily: 'NexaBold',

                    )
                )
            ),),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ),

);
  }Future pickImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);


  setState(() {
    imageBytes = File(image!.path).readAsBytesSync();
  });
}
Widget buildImage() {
  return imageBytes !=null ?Image.memory(imageBytes!):Container();
}}


