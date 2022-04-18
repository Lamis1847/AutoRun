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
Future<Widget> Picture(nomController, prenomController, emailController,
    mdpController, phoneContoller) async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras[1];

  return TakePictureScreen(
    camera: firstCamera,
    nomController: nomController,
    prenomController: prenomController,
    emailController: emailController,
    phoneContoller: phoneContoller,
    mdpController: mdpController,
  );
}

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen({
    Key? key,
    required this.camera,
      required this.nomController,
      required this.emailController,
      required this.prenomController,
      required this.phoneContoller,
      required this.mdpController
  }) : super(key: key);

  final CameraDescription camera;
  final nomController;
  final emailController;
  final prenomController;
  final mdpController;
  final phoneContoller;
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  
  late CameraController _controller;
  late CameraController _cameraController;
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
                  nomController: widget.nomController,
                  prenomController: widget.prenomController,
                  emailController: widget.emailController,
                  phoneContoller: widget.phoneContoller,
                  mdpController: widget.mdpController,
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
      required this.nomController,
      required this.emailController,
      required this.prenomController,
      required this.phoneContoller,
      required this.mdpController})
      : super(key: key);
  final nomController;
  final emailController;
  final prenomController;
  final mdpController;
  final phoneContoller;
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
                      nomController: nomController,
                      prenomController: prenomController,
                      emailController: emailController,
                      phoneContoller: phoneContoller,
                      mdpController: mdpController,
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
