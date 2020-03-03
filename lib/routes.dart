import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_auth.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_otp.dart';
import 'package:pa_flutter_t4H/screens/home.dart';
import 'package:pa_flutter_t4H/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => Splash(),
  AuthGetPhone.routeName: (BuildContext context) => AuthGetPhone(),
  AuthOTPPhone.routeName: (BuildContext context) => AuthOTPPhone(),
  Home.routeName: (BuildContext context) => Home(),
};
