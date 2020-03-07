import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    @required this.photoUrl,
    @required this.radius,
  });
  final String photoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        //borderRadius: BorderRadius.circular(radius * 1.2),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey[300],
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
        ),
      ),
    );
  }
}