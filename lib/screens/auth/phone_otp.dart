import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pa_flutter_t4H/screens/home.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:provider/provider.dart';

class AuthOTPPhone extends StatefulWidget {
  static const routeName = '/otp';
  @override
  _AuthOTPPhoneState createState() => _AuthOTPPhoneState();
}

class _AuthOTPPhoneState extends State<AuthOTPPhone> {
  TextEditingController smsCodeCtrl = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      auth.smsCode = smsCodeCtrl.text;
      await auth.signIn().then((value) {
        Navigator.of(context).pop();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final phoneNoWithCode = args['phoneNo'];
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.white,
                systemNavigationBarColor: Colors.white),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                ),
                Image.asset('assets/images/pakchat_logo2.png'),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: SvgPicture.asset(
                    'assets/images/undraw4.svg',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Enter code sent to ",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      phoneNoWithCode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 16.0),
                    ),
                  ],
                ),
                Text(
                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy.",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: smsCodeCtrl,
                          keyboardType: TextInputType.phone,
                          autofocus: false,
                          style: TextStyle(letterSpacing: 1, fontSize: 16.0),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 32.0),
                          child: Text(
                            'Verify',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          onPressed: () => _signIn(context),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )))));
  }
}
