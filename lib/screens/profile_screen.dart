import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_flutter_t4H/widgets/custom_header.dart';

class Profile extends StatelessWidget {

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(
              statusBarColor: Theme.of(context).accentColor,
              systemNavigationBarColor: Colors.white),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              WavyAppHeader(title: 'Profile', logoutBtn: true,)
            ]
          )
        )
      )
    );
  }
}