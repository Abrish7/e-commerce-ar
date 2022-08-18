import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(
        "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg");

    return Stack(
      children: [
        _profileImage(image),
        Positioned(bottom: 0, right: 4, child: editButton(Colors.blue))
      ],
    );
  }

  ClipOval _profileImage(NetworkImage image) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          width: 128,
          height: 128,
          image: image,
          child: InkWell(
            onTap: (() {}),
          ),
        ),
      ),
    );
  }

  editButton(Color color) {
    return buildCircle(
      all: 3,
      color: Colors.white,
      child: buildCircle(
        color: color,
        all: 8.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  buildCircle(
      {required Color color, required double all, required Widget child}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}
