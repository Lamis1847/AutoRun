import 'package:flutter/material.dart';
import 'package:AutoRun/main.dart';
import 'package:AutoRun/delayed_animation.dart';
import 'package:AutoRun/selfie_page.dart' as selfi;

class TakeSelfie extends StatelessWidget {
  const TakeSelfie({Key? key}) : super(key: key);

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
            vertical: 40,
            horizontal: 30,
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 5),
              DelayedAnimation(
                delay: 500,
                child: SizedBox(
                  height: 50,
                  child: Image.asset('images/Prendre un selfie.png'),
                ),
              ),
              const SizedBox(height: 25),
              const DelayedAnimation(
                delay: 700,
                child: Text(
                  "Cliquer sur le bouton pour prendre un selfie",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'NexaXRegular',
                    color: Color.fromRGBO(112, 112, 112, 100),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              DelayedAnimation(
                delay: 1000,
                child: SizedBox(
                  height: 170,
                  child: Image.asset('images/Groupe.png'),
                ),
              ),
              const SizedBox(height: 70),
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
                              builder: (context) => pageCamera,
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
                              "Prendre un selfie",
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
