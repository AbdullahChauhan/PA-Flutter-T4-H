import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/screens/profile_screen.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:provider/provider.dart';

class WavyAppHeader extends StatelessWidget {
  final bool userAvatar;
  final bool backButton;
  final bool isTitle;
  final String title;
  final bool isSubTitle;
  final String subTitle;
  final bool searchField;
  final bool addUserBtn;
  final bool userActiveStatus;
  final bool searchBtn;
  final bool logoutBtn;

  const WavyAppHeader({Key key, this.userAvatar = false, this.backButton = true, this.isTitle = true, this.title, this.isSubTitle = false, this.subTitle, this.searchField = false, this.addUserBtn = false, this.userActiveStatus = false, this.searchBtn = false, this.logoutBtn = false}) : super(key: key);

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
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 90.0,
          ),
          clipper: BottomWaveClipper(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.0, top: 14.0, bottom: 18.0),
          child: Row(
            children: <Widget>[
              backButton ? GestureDetector(
                child: Icon(Icons.arrow_back, size: 32.0, color: Colors.white),
                onTap: () => Navigator.of(context).pop(),
              ) : SizedBox(),
              userAvatar ? GestureDetector(
                              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                ),
                onTap: () => Navigator.pushNamed(context, Profile.routeName),
              ) : SizedBox(),
              SizedBox(
                width: 8.0,
              ),
              isTitle ? Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ) : SizedBox(),
              isSubTitle ? Text(
                subTitle,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ) : SizedBox(),
              Spacer(),
              addUserBtn ? GestureDetector(
                child: Icon(Icons.add, size: 32.0, color: Colors.white),
                onTap: () => print('Clicked!'),
              ) : SizedBox(),
              SizedBox(
                width: 12.0,
              ),
              searchBtn ? Container(
                height: 35,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: Theme.of(context).primaryColor),
                child: GestureDetector(
                  child: Icon(Icons.search, size: 28.0, color: Colors.white),
                  onTap: () => print('Clicked!'),
                ),
              ) : SizedBox(),
              logoutBtn ? Container(
                height: 35,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: Theme.of(context).primaryColor),
                child: GestureDetector(
                  child: Icon(Icons.exit_to_app, size: 28.0, color: Colors.white),
                  onTap: () => _signOut(context),
                ),
              ) : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = new Offset(size.height / 4, size.height);
    var firstEndPoint = new Offset(size.width / 2.0, size.height - 20.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 64), size.height - 40);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
