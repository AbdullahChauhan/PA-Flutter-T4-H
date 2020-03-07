import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:pa_flutter_t4H/widgets/custom_header.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

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
              WavyAppHeader(backButton: false, userAvatar: true, title: 'Chats', isSubTitle: false,  addUserBtn: false, searchBtn: true,),
            ],
          ),
        ),
      ),
    );
  }
}
