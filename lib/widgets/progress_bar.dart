import 'dart:math';

import 'package:flutter/material.dart';

typedef ProgressChanged<double> = void Function(double value);

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);

class CircleProgressBar extends StatelessWidget {
  final double radius;
  final double progress;
  final double ringWidth;
  final double shadowWidth;
  final Color shadowColor;
  final Color dotColor;
  final Color dotEdgeColor;
  final Color ringColor;

  final ProgressChanged progressChanged;

  const CircleProgressBar({
    Key key,
    @required this.radius,
    @required this.ringWidth,
    @required this.dotColor,
    this.shadowWidth = 2.0,
    this.shadowColor = Colors.black26,
    this.ringColor = const Color(0XFFF7F7FC),
    this.dotEdgeColor = const Color(0XFFF5F5FA),
    this.progress,
    this.progressChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = this.radius * 2.0;
    final size = new Size(width, width);
    return Container(
      alignment: FractionalOffset.center,
      child: CustomPaint(
        size: size,
        painter: ProgressPainter(
            ringWidth: this.ringWidth,
            shadowWidth: this.shadowWidth,
            shadowColor: this.shadowColor,
            ringColor: this.ringColor,
            progressColor: this.dotColor,
            dotColor: this.dotEdgeColor,
            progress: this.progress),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double ringWidth;
  final double shadowWidth;
  final Color shadowColor;
  final Color progressColor;
  final Color dotColor;
  final Color ringColor;
  final double progress;

  ProgressPainter({
    this.ringWidth,
    this.shadowWidth = 2.0,
    this.shadowColor = Colors.black12,
    this.ringColor = const Color(0XFFF7F7FC),
    this.progressColor,
    this.dotColor = const Color(0XFFF5F5FA),
    this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double center = size.width * 0.5;
    final Offset offsetCenter = Offset(center, center);
    final double drawRadius = size.width * 0.5 - ringWidth;
    final angle = 360.0 * progress;
    final double radians = degToRad(angle);

    final double outerRadius = center - ringWidth;
    final double innerRadius = outerRadius - ringWidth;

    Path path = Path.combine(
        PathOperation.difference,
        Path()
          ..addOval(Rect.fromCircle(center: offsetCenter, radius: outerRadius)),
        Path()
          ..addOval(
              Rect.fromCircle(center: offsetCenter, radius: innerRadius)));
    canvas.drawShadow(path, shadowColor, 4.0, true);

    // draw ring.
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = ringColor
      ..strokeWidth = (outerRadius - innerRadius);
    canvas.drawCircle(offsetCenter, drawRadius, ringPaint);

    final Color currentColor = progressColor;

    final Color currentInnerColor =
        Color.alphaBlend(progressColor.withOpacity(0.7), Colors.white);

    final progressWidth = ringWidth + 6.0;
    // draw progress.
    if (progress > 0.0) {
      final double offset = asin(progressWidth * 0.5 / drawRadius);
      if (radians > offset) {
        canvas.save();
        canvas.translate(0.0, size.width);
        canvas.rotate(degToRad(-90.0));
        final Gradient gradient = new SweepGradient(
          endAngle: radians,
          colors: [
            currentColor,
            currentInnerColor,
            currentColor,
          ],
        );
        final Rect arcRect =
            Rect.fromCircle(center: offsetCenter, radius: drawRadius);
        final progressPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = progressWidth
          ..color = progressColor;
        canvas.drawArc(arcRect, offset, radians - offset, false, progressPaint);
        progressPaint
          ..strokeWidth = progressWidth - 4.0
          ..shader = gradient.createShader(arcRect);
        canvas.drawArc(arcRect, offset, radians - offset, false, progressPaint);
        canvas.restore();
      }
    }

    // draw dot.
    final double dx = center + drawRadius * sin(radians);
    final double dy = center - drawRadius * cos(radians);

    final dotRadius = progressWidth * 0.5 * 0.75;
    final shadowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowWidth);
    canvas.drawCircle(
        new Offset(dx + shadowWidth, dy + shadowWidth), dotRadius, shadowPaint);
    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(new Offset(dx, dy), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
