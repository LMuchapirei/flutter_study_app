import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;
  const BackgroundDecoration(
      {Key? key, this.showGradient = false, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            // Creates a Positioned object with [left], [top], [right], and [bottom] set to 0.0 unless a value for them is passed.
            child: Container(
          decoration: BoxDecoration(
              gradient: showGradient ? mainGradient(context) : null,
              color: showGradient ? null : Theme.of(context).primaryColor),
          child: CustomPaint(painter: BackgroundPainter()),
        )),
        Positioned.fill(child: SafeArea(child: child))
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white.withOpacity(
          0.1); // Same as creating an object of type Paint, then set its color property on seperate line , just we are doing this on one line
    final path = Path();

    // Drawing the first segment
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0); // go horizontally up to 20% of the with
    path.lineTo(0, size.height * .4); // go to the point thats on y axis 40%
    path.close();

    // create a new path for the next segment
    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();
    canvas.drawPath(path,
        paint); // takes the paint and path and draws accordingly on the canvas
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
