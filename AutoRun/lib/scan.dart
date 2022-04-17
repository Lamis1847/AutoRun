import 'package:AutoRun/joindre_permis.dart';
import 'package:flutter/material.dart';
import 'package:AutoRun/main.dart';
import 'package:AutoRun/delayed_animation.dart';
import 'package:AutoRun/selfie_page.dart' as selfi;

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 30,
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 5),
             const DelayedAnimation(
                delay: 700,
                child: Text(
                  "Joindre votre pièce d'identité",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'NexaXBold',
                    color: d_blue,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const DelayedAnimation(
                delay: 700,
                child: Text(
                  "Complétez votre inscription en toute sécurité avec un scan de votre permis de conduite.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'NexaXRegular',
                    color: Color.fromRGBO(112, 112, 112, 100),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              DelayedAnimation(
                delay: 1000,
                child: SizedBox(
                  height: 170,
                  child: Image.asset('images/Card.png'),
                ),
              ),
              const SizedBox(height: 50),
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
                        onPressed: () async {
                          // Fonction doit etre async
                          Widget pageCamera = await selfi.main(); // attendez l'init
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(),
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
                              "Joindre une photo",
                              style: TextStyle(
                                fontFamily: 'NexaXRegular',
                                color: Colors.white,
                                fontSize: 18,
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
