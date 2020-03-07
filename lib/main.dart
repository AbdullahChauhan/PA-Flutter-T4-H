import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/routes.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:pa_flutter_t4H/services/firestore.dart';
import 'package:pa_flutter_t4H/services/image_picker.dart';
import 'package:pa_flutter_t4H/services/storage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<ImagePickerService>(
          create: (_) => ImagePickerService(),
        ),
        Provider<FirebaseStorageService>(
          create: (_) => FirebaseStorageService(),
        ),
        Provider<FirestoreService>(
          create: (_) => FirestoreService(),
        ),
        Provider<User>(
          create: (_) => User(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PakChat App',
        theme: ThemeData(
            primaryColor: Color(0xFF28BB4E),
            accentColor: Color(0xFF3E3E3E),
            fontFamily: 'Nunito'),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
