import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_otp.dart';
import 'package:pa_flutter_t4H/services/auth.dart';

class AuthGetPhone extends StatefulWidget {
  @override
  _AuthGetPhoneState createState() => _AuthGetPhoneState();
}

class _AuthGetPhoneState extends State<AuthGetPhone> {
  TextEditingController phoneCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String countryCode;

  AuthService _authService = AuthService();

  @override
  void initState() {
    countryCode = '+92';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, systemNavigationBarColor: Colors.white),
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
                  'assets/images/undraw5.svg',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Lorem ipsum, or lipsum as it is sometimes known, is dummy. Lorem ipsum, or lipsum as it is sometimes known, is dummy.",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Select your country'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(16.0),
                          child: CountryCodePicker(
                            onChanged: (CountryCode code) {
                              setState(() {
                                countryCode = code.toString();
                              });
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'PK',
                            favorite: ['+92', 'PK'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: true,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                            // optional. Show only flag
                            showFlag: false,
                            textStyle: TextStyle(fontSize: 16.0),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                      Text(
                        'Enter your phone number'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 13.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.zero),
                                ),
                                child: Text(
                                  countryCode,
                                  style: TextStyle(
                                      fontSize: 16.0, letterSpacing: 1),
                                )),
                            SizedBox(
                              width: 2.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneCtrl,
                                keyboardType: TextInputType.phone,
                                autofocus: false,
                                style:
                                    TextStyle(letterSpacing: 1, fontSize: 16.0),
                                decoration: InputDecoration(
                                  hintText: '3179696969',
                                  hintStyle: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.grey[400]),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.only(
                                      left: 8.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.zero,
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.circular(8)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.zero,
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24.0),
                        child: Text(
                          'Verify Phone Number',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () {
                          _authService.countryCode = countryCode;
                          _authService.phoneNo = phoneCtrl.text;
                          _authService.verifyPhone().then((value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AuthOTPPhone();
                            }));
                          }).catchError((e) {
                            print(e.toString());
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
