import 'package:bike_shopping/res/resources.dart';
import 'package:flutter/material.dart';

class ActiveIcon extends StatelessWidget {
  final Icon icon;
  final Resources resources;

  const ActiveIcon({super.key, required this.icon, required this.resources});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipPath(
        clipper: CustomShapeActiveIcon(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  resources.color.activeColor1,
                  resources.color.activeColor2
                ]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: icon,
        ),
      ),
    );
  }
}

class CustomShapeActiveIcon extends CustomClipper<Path> {
  final double radius;

  CustomShapeActiveIcon(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Bắt đầu từ góc trái trên
    path.moveTo(0, radius + 10);
    path.arcToPoint(
      Offset(radius, 10), // Góc bo tròn bên trái trên
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Đến góc phải trên
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius), // Góc bo tròn bên phải trên
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Đến góc phải dưới
    path.lineTo(size.width, size.height - radius - 10);
    path.arcToPoint(
      Offset(
          size.width - radius, size.height - 10), // Góc bo tròn bên phải dưới
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Đến góc trái dưới
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius), // Góc bo tròn bên trái dưới
      radius: Radius.circular(radius),
      clockwise: true,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
