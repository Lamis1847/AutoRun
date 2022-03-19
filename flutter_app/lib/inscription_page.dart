import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/icons/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterapp/login_page.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/delayed_animation.dart';
import 'package:flutterapp/selfie_page.dart';
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
            Align(
                  alignment: Alignment.centerLeft,),
            DelayedAnimation(
              delay: 100,
              child: Text(
                "Let's get started",
                style: TextStyle(
                  fontFamily: 'NexaXRegular',
                  color: Color.fromRGBO(112, 112, 112,100),
                  fontSize: 20,
                ),
              ),
            ),
            
            SizedBox(height: 35),
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
                labelText: 'First Name',
                prefixIcon: Icon(ProjectIcons.user),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 1500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                prefixIcon: Icon(ProjectIcons.user),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),])
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
        RequiredValidator(errorText: "* Required"),
        EmailValidator(errorText: "Enter valid email id"),
      ])
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 3500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Icon(ProjectIcons.call_incoming),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),])
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
                labelText: 'Password',
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
            RequiredValidator(errorText: "* Required"),
            MinLengthValidator(6,
                errorText: "Password should be atleast 6 characters"),
            MaxLengthValidator(15,errorText:"Password should not be greater than 15 characters")
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
                labelText: 'Confirmation password',
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
            RequiredValidator(errorText: "* Required"),
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
                  'Continue',
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
                      builder: (context) => CameraExampleHome(),
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
