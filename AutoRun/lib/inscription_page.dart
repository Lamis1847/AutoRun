import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:AutoRun/welcome_page.dart';
import 'icons/icons.dart';
import 'login_page.dart';
import 'main.dart';
import 'delayed_animation.dart';
import 'take_selfie.dart';
import 'selfie_page.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:path/path.dart';
import 'dart:convert';

class EmailFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[\w-\,]+@([\w-]+\.)[\w-]{2,4}').hasMatch(value))
      return "Email can't be empty or invalid";
    return null;
  }
}
class NameFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
      return "Name can't be empty or invalid";
    return null;
  }
}
class PasswordFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty || value.length < 8 || value.length > 15)
      return "Password can't be empty or invalid";
    return null;
  }
}
class PhoneFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty ||  !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value))
      return "Phone number can't be empty or invalid";
    return null;
  }
}
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
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
            ),
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
                    color: Color.fromRGBO(112, 112, 112, 100),
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
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var nomController = TextEditingController();
  var emailController = TextEditingController();
  var prenomController = TextEditingController();
  var mdpController = TextEditingController();
  var phoneContoller = TextEditingController();
  var confirmMdpController = TextEditingController();
  

  var _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String? _nom = '';
  String? _prenom = '';
  String? _email = '';
  String? _phone = '';
  TextEditingController _password = TextEditingController();
  TextEditingController _Confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            DelayedAnimation(
              delay: 500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(ProjectIcons.user),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return '* Entrez un nom valide';
                  }
                  return null;
                },
                onSaved: (String? nom) {
                  _nom = nom;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 1500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: prenomController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(ProjectIcons.user),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return '* Entrez un prenom valide';
                  }
                  return null;
                },
                onSaved: (String? prenom) {
                  _prenom = prenom;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 2500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(ProjectIcons.envelope),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\w-\,]+@([\w-]+\.)[\w-]{2,4}')
                          .hasMatch(value)) {
                    return '* Entrez un email valide';
                  }
                  return null;
                },
                onSaved: (String? email) {
                  _email = email;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller:  phoneContoller,
                decoration: InputDecoration(
                  labelText: 'N° téléphone',
                  prefixIcon: Icon(ProjectIcons.call_incoming),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                    return '* Entrez un numero de téléphone valide';
                  }
                  return null;
                },
                onSaved: (String? phone) {
                  _phone = phone;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 4500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _password,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Entrez un numero de téléphone valide';
                  }
                  if (value.length < 8) {
                    return "Doit contenir au moins 6 characteres";
                  }
                  if (value.length > 15) {
                    "Ne doit pas contenir plus de 15 characteres";
                  }

                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 5500,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _Confirmpassword,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Obligatoire';
                  }
                  if (!equals(_password.text, _Confirmpassword.text)) {
                    return "Le mot de passe doit etre identique";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 50),
            DelayedAnimation(
              delay: 6000,
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

                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    signup(context);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signup(BuildContext context) async {

    if (nomController.text.isNotEmpty && prenomController.text.isNotEmpty && emailController.text.isNotEmpty && phoneContoller.toString().isNotEmpty   && _password.text.isNotEmpty  ) {
      var response = await http.post(
          Uri.parse(
              'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/signup/locataire'),
          headers: <String,String>{
            'Content-Type':'application/json; charset=UTF-8',
          },

          body: jsonEncode(<String,String> {
            "email": emailController.text,
            "mdp": _password.text,
            "prenom": prenomController.text,
            "nom": nomController.text,

            "num_tel": phoneContoller.text,
            "adresse_locataire":"vhvvvhvhvhunnnnnnnnnn",
            "photo":"vhvvvhvhvhunnnnnnnnnn",
            "piece_identite":"vhvvvhvhvhunnnnnnnnnn"
          }));




      print('Response status: ${response.body}');
      if (response.statusCode == 200) {
        print("hello world");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  TakeSelfie()));
      } else {
        if (response.statusCode == 401) {

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Details manquants")));
        } else {
          if (response.statusCode == 405) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User Already exists")));
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
