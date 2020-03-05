import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_auth.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user != null ? Home() : AuthGetPhone();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
