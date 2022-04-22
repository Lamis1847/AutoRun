import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'delayed_animation.dart';
import 'package:image_picker/image_picker.dart';
import 'Attente.dart';
import 'inscription_page.dart';
import 'package:flutter_svg/svg.dart';
import 'selfie_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.imagePath,
      required this.nomController,
      required this.emailController,
      required this.prenomController,
      required this.phoneContoller,
      required this.mdpController}) : super(key: key);

  final String title;
  final String imagePath;
  final nomController;
  final emailController;
  final prenomController;
  final mdpController;
  final phoneContoller;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? imageBytes;
  bool selecimage = false;
  bool selectext = true;


  late String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
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
            )
          ),*/

        body: Container(
            child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 48,),
          Spacer(
            flex: 2,
          ),

          Text("Joindre votre pièce d'identité.\n ",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Color(0xFF4361EE),
                fontFamily: 'NexaBold',
              )),
          Text(
              "Complétez votre inscription en toute sécurité avec un scan de votre permis de conduite.\n ",
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 2.0,
                color: Colors.grey[400],
                fontFamily: 'NexaThin',
              )),

          Spacer(
            flex: 2,
          ),

          selecimage
              ? SvgPicture.asset('images/ID_Card.svg', width: 230, height: 230)
              : Container(
                  height: (MediaQuery.of(context).size.height) / 2.5,
                  width: (MediaQuery.of(context).size.width),
                  child: ClipOval(
                    child: buildImage(),
                    //borderRadius: BorderRadius.circular((MediaQuery.of(context).size.width) / 4),
                  ),
                ),

          Text('\n'),

          Spacer(
            flex: 1,
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF4361EE),
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(17.0))),
            onPressed: () {
              if (selectext == true) {
                pickImage();
                selectext = false;
              } else {
                signup(context);
              }
            },
            child: selectext
                ? Text(
                    "Joindre une photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.0,
                      letterSpacing: 2.0,
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'NexaBold',
                    ),
                  )
                : Text(
                    "Terminer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.0,
                      letterSpacing: 2.0,
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'NexaBold',
                    ),
                  ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  selecimage = !selecimage;
                  selectext = !selectext;
                });
              },
            ),
          ),
        ],
      ),
    )));
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageBytes = File(image!.path).readAsBytesSync();
    });
  }

  Widget buildImage() {
    return imageBytes != null
        ? Image.memory(imageBytes!)
        : Container(
            child:
                SvgPicture.asset('images/ID_Card.svg', width: 230, height: 230),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              //more than 50% of width makes circle
            ),
          );
  }

  Future<void> signup(BuildContext context) async {
    
    if (widget.nomController.isNotEmpty &&
        widget.prenomController.isNotEmpty &&
        widget.emailController.isNotEmpty &&
        widget.mdpController.isNotEmpty &&
        widget.phoneContoller.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/signup/locataire'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "email": widget.emailController,
            "mdp": widget.mdpController,
            "prenom":  widget.prenomController,
            "nom": widget.nomController,
            "num_tel": widget.phoneContoller,
            "adresse_locataire": "vhvvvhvhvhunnnnnnnnnn",
            "photo": "vhvvvhvhvhunnnnnnnnnn",
            "piece_identite": "vhvvvhvhvhunnnnnnnnnn"
          }));

      print('Response status: ${response.body}');
      if (response.statusCode == 200) {
        print("hello world");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WaitingPage()));
      } else {
        if (response.statusCode == 401) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Details manquants")));
        } else {
          if (response.statusCode == 405) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("User Already exists")));
          } else {
            if (response.statusCode == 500) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Erreur Serveur")));
            }
          }
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("veuillez remplir les champs")));
    }
  }
}

class MyCircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 200);
  }

  @override
  bool shouldReclip(MyCircleClipper oldClipper) {
    return false;
  }
}
