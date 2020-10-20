import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_ui_flutter/widgets/curve_clipper.dart';
import 'package:social_ui_flutter/widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                image: AssetImage('images/login_background.jpg'),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "SOCIALLY",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10.0),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: LoginTextField(
                margin: 10.0,
                hint: "Username",
                prefixIcon: Icon(
                  Icons.account_box,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: LoginTextField(
                margin: 10.0,
                hint: "Username",
                prefixIcon: Icon(
                  Icons.lock,
                ),
                obscureText: true,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    height: 80.0,
                    child: Text(
                      "Don't have an account? Sign up?",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
