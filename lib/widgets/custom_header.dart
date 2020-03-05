import 'package:flutter/material.dart';

class WavyAppHeader extends StatelessWidget {
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
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Chats',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              Spacer(),
              GestureDetector(
                child: Icon(Icons.add, size: 32.0, color: Colors.white),
                onTap: () => print('Clicked!'),
              ),
              SizedBox(
                width: 12.0,
              ),
              Container(
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
              ),
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
