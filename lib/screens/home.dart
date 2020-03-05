import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:pa_flutter_t4H/widgets/custom_header.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: Colors.white),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              WavyAppHeader()
              // RaisedButton(
              //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              //   child: Text(
              //     'Logout',
              //     style: TextStyle(color: Colors.white, fontSize: 16.0),
              //   ),
              //   color: Theme.of(context).primaryColor,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(100),
              //   ),
              //   onPressed: () => _signOut(context)
              // )
            ],
          ),
        ),
      ),
    );
  }
}
