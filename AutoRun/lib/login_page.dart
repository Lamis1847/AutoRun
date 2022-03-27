import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:AutoRun/welcome_page.dart';
import '/main.dart';
import 'icons/icons.dart';
import 'delayed_animation.dart';
import 'take_selfie.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';


class LoginPage extends StatelessWidget {

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
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  DelayedAnimation(
                    delay: 1000,
                    child: Container(
                      height: 50,
                      child: Image.asset('images/Re-bienvenue.png'),
                    ),
                  ),
                  SizedBox(height: 25),
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
            SizedBox(height: 10),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {

  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailsController = TextEditingController();

  var passwordController = TextEditingController();
  var _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailsController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(ProjectIcons.envelope),
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    hintText: 'exemple mail abc@gmail.com'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\w-\,]+@([\w-]+\.)[\w-]{2,4}')
                          .hasMatch(value)) {
                    return '* Entrez un email valide';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 4500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
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
                  ])),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
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
            SizedBox(height: 60),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    // <--- use this
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  if (_formKey.currentState!.validate()) {
                    login(context);
                  }
                },
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
  Future<void> login(BuildContext context) async {
    if (emailsController.text.isNotEmpty &&  passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/login/locataire'),
          headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
          },

          body: jsonEncode(<String,String> {


            "email": emailsController.text,
            "mdp": passwordController.text,

          }));

      print('Response status: ${response.body}');
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      } else {
        if (response.statusCode == 401) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Details manquants")));
        } else {
          if (response.statusCode == 404) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Not Found: compte enexistant")));
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
