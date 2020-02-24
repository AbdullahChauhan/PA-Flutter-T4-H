import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Image.asset('assets/images/pakchat_logo1.png'),
              Spacer(),
              Text(
                'Designed by PakStudent'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
