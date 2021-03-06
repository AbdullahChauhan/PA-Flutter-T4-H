import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_auth.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_otp.dart';
import 'package:pa_flutter_t4H/screens/home.dart';
import 'package:pa_flutter_t4H/screens/profile_screen.dart';
import 'package:pa_flutter_t4H/widgets/auth_widget.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => AuthWidget(),
  AuthGetPhone.routeName: (BuildContext context) => AuthGetPhone(),
  AuthOTPPhone.routeName: (BuildContext context) => AuthOTPPhone(),
  Home.routeName: (BuildContext context) => Home(),
  Profile.routeName: (BuildContext context) => Profile()
};
