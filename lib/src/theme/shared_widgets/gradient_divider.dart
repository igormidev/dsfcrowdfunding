import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({
    super.key,
    this.thickness = 2,
    this.height = 8,
  });
  final double thickness;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff3E3E3E).withAlpha(50),
              const Color(0xff3E3E3E).withAlpha(100),
              const Color(0xff3E3E3E),
              const Color(0xff484848),
              const Color(0xff3E3E3E),
              const Color(0xff3E3E3E).withAlpha(100),
              const Color(0xff3E3E3E).withAlpha(50),
            ],
          ),
        ),
        height: thickness,
      ),
    );
  }
}
