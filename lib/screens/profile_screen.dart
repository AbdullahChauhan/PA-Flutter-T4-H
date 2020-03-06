import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_flutter_t4H/widgets/custom_header.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Theme.of(context).accentColor,
                systemNavigationBarColor: Colors.white),
            child: SafeArea(
                child: Column(children: <Widget>[
              WavyAppHeader(
                title: 'Profile',
                logoutBtn: true,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 75.0,
                        ),
                        Positioned(
                            bottom: 5.0,
                            right: 5.0,
                            child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                onTap: () => print('Clicked!'))),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }
}
