import 'package:flutter/material.dart';

class ZenithCareLogo extends StatelessWidget {
  const ZenithCareLogo({
    super.key,
    this.size = 64,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: MountainPainter(),
        ),
        const SizedBox(width: 12),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Zenith',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              TextSpan(
                text: 'Care',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    // Left peak
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.35, size.height * 0.15);

    // Main peak (zenith)
    path.lineTo(size.width * 0.55, size.height * 0.45);
    path.lineTo(size.width * 0.8, 0);

    // Right side
    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawPath(path, paint);

    // Snow cap effect
    final capPaint = Paint()..color = Colors.white.withValues(alpha: 0.6);

    final cap = Path()
      ..moveTo(size.width * 0.68, size.height * 0.18)
      ..lineTo(size.width * 0.8, 0)
      ..lineTo(size.width * 0.9, size.height * 0.18)
      ..close();

    canvas.drawPath(cap, capPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
