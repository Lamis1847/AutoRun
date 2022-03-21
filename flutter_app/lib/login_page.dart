import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/icons/icons.dart';
import 'package:flutterapp/delayed_animation.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
               
                margin: EdgeInsets.symmetric(vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 5), 
                DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: 150,
                  child: Image.asset('images/Re-bienvenue.png'),
                ),
              ),
                  SizedBox(height: 20),
                   
                  
                  DelayedAnimation(
                    delay: 2500,
                    child: Text(
                      "Pour continuer, Entrez votre email et mot de passe.",
                      style: TextStyle(
                      fontFamily: 'NexaXRegular',
                      color: Colors.grey[400],
                      fontSize: 16,
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
            SizedBox(height: 35),
            LoginForm(),
             Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                  },
                  child: DelayedAnimation(
                    delay: 5000,
                    child: Text(
                      "Mot de passe oublié ?",
                       style: TextStyle(
                        fontFamily: 'NexaXRegular',
                        color: d_blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 125),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( // <--- use this
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                  primary: d_blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'Se connecter',
                 style: TextStyle(
                              fontFamily: 'NexaXRegular',
                              color: Colors.white,
                              fontSize: 22,
                              
                            ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
              ),
            ),
           SizedBox(height: 35), 
          ],
        ),
      ),
    );
  }
}
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      
      child: Column(
        
        children: [
          DelayedAnimation(
            delay: 3500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(ProjectIcons.envelope),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                   
                ),
                hintText: 'Entrer un email id valide par exemple abc@gmail.com'
              ),
              validator: MultiValidator([
        RequiredValidator(errorText: "* Obligatoire"),
        EmailValidator(errorText: "Entrer un email id valide"),
      ])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 4500,
            child: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                prefixIcon: Icon(ProjectIcons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              
             validator: MultiValidator([
        RequiredValidator(errorText: "* Obligatoire"),
        MinLengthValidator(6,
            errorText: "Le mot de passe doit contenir au moins 6 characteres"),
        MaxLengthValidator(15,errorText:"Le mot de passe ne doit pas contenir plus de 15 characteres")
      ])
            ),
          ),
        ],
      ),
    );
  }
}