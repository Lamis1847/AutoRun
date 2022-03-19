import 'package:flutter/material.dart';
import 'package:flutterapp/icons/icons.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/delayed_animation.dart';
import 'package:flutterapp/take_selfie.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InscriptionPage extends StatelessWidget {
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
      
      body: SingleChildScrollView(
        child: Column(
           
          children: [
            
             DelayedAnimation(
              delay: 100,
              
              child: Text(  
                "C'est parti.",
                 
                style: TextStyle(
                  fontFamily: 'NexaXBold',
                  color: d_blue,
                  fontSize: 32,
                ),
              ),
               
            ),
            
            SizedBox(height: 25),
            DelayedAnimation(
              delay: 250,
               child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Remplir les informations nécessaires pour l'inscription.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NexaXRegular',
                  color: Color.fromRGBO(112, 112, 112,100),
                  fontSize: 16,
                ),
              ),
               ),
            ),
            
            SizedBox(height: 50),
            LoginForm(),
            SizedBox(height: 100),
            
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
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom',
                prefixIcon: Icon(ProjectIcons.user),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Obligatoire"),])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 1500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Prénom',
                prefixIcon: Icon(ProjectIcons.user),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Obligatoire"),])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 2500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(ProjectIcons.envelope),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
        RequiredValidator(errorText: "* Obligatoire"),
        EmailValidator(errorText: "Entrer un email id valide"),
      ])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 3500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'N° téléphone',
                prefixIcon: Icon(ProjectIcons.call_incoming),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Obligatoire"),])
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
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 5500,
            child: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Confirmation du mot de passe',
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
            ])
            ),
          ),
          SizedBox(height: 50),
            DelayedAnimation(
              delay: 6000,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( // <--- use this
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                  primary: d_blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'Continuer',
                 style: TextStyle(
                              fontFamily: 'NexaBold',
                              color: Colors.white,
                              fontSize: 22,
                              
                            ),
                ),
                onPressed: () {
                  var Camera;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TakeSelfie(),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
