import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/routes.dart';
import 'package:pa_flutter_t4H/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PakChat App',
      theme: ThemeData(
        primaryColor: Color(0xFF28BB4E),
        accentColor: Color(0xFF3E3E3E),
        fontFamily: 'Nunito'
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
