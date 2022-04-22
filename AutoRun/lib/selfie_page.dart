import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:AutoRun/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:AutoRun/joindre_permis.dart';
import 'welcome_page.dart';

//import 'package:http/http.dart'as http;
Future<Widget> Picture(lastname, firstname, email,
    mdp, phone) async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras[1];

  return TakePictureScreen(
    camera: firstCamera,
    lastname: lastname,
    firstname: firstname,
    email: email,
    phone: phone,
    mdp: mdp,
  );
}

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen({
    Key? key,
    required this.camera,
      required this.lastname,
      required this.firstname,
      required this.email,
      required this.phone,
      required this.mdp
  }) : super(key: key);

  final CameraDescription camera;
  late String firstname;
  late String lastname;
  late String email;
  late String phone;
  late String mdp;
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  
  late CameraController _controller;
  late CameraController _cameraController;
  late String firstname;
  late String lastname;
  late String email;
  late String phone;
  late String mdp;
  late Future<void> _initializeControllerFuture;
  int i = 0;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prendre une photo'),
        backgroundColor: d_blue,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                  lastname: lastname,
                  firstname: firstname,
                  email: email,
                  phone: phone,
                  mdp: mdp,
              
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  DisplayPictureScreen(
      {Key? key,
      required this.imagePath,
       required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.mdp})
      : super(key: key);
  late String firstname;
  late String lastname;
  late String email;
  late String phone;
  late String mdp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Afficher l'image"),
          backgroundColor: d_blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      title: '',
                      lastname: lastname,
                      firstname:firstname,
                      email: email,
                      phone: phone,
                      mdp: mdp,
                      imagePath: imagePath,
                    ),
                  ),
                );
              },
            ),
          ]),
      body: Image.file(File(imagePath)),
    );
  }
}
