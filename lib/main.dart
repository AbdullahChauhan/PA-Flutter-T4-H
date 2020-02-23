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
      // theme: lightTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}
