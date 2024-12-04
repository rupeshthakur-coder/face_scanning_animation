import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

// Stateful widget to animate text
class AnimatedText extends StatefulWidget {
  final String? backgroundImage; // Optional background image

  const AnimatedText({super.key, this.backgroundImage});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls the animation
  late Animation<double> _animation; // Defines the animation
  int _currentIndex = 0; // Tracks the current label index
  late Timer _timer; // Timer to change labels periodically

  // List of labels to display
  final List<String> labels = [
    'Acne',
    'Wrinkles',
    'Dryness',
    'Pigmentation',
    'Oily',
    'Pores',
    'Dark Circles',
    'Dark Spots',
    'Acne Scars',
  ];

  // List of colors for the labels
  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.transparent,
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a longer duration
    _controller = AnimationController(
      duration:
          const Duration(seconds: 3), // Increased duration for slower animation
      vsync: this,
    );

    // Define the animation sequence
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Repeat the animation indefinitely
    _controller.repeat();

    // Set up a timer to change the label every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % labels.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    _timer.cancel(); // Cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Display background image if provided
          if (widget.backgroundImage != null)
            Image.asset(
              widget.backgroundImage!,
              fit: BoxFit.cover,
            ),
          // Use AnimatedBuilder to repaint the CustomPainter
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: FaceAnalysisPointsPainter(_animation.value),
              );
            },
          ),
          // Display text at different positions based on _currentIndex
          if (_currentIndex == 0)
            _buildText(context, 0.5, 0.5, labels[0], colors[0]),
          if (_currentIndex == 1)
            _buildText(context, 0.5, 0.3, labels[1], colors[1]),
          if (_currentIndex == 2)
            _buildText(context, 0.8, 0.6, labels[2], colors[2]),
          if (_currentIndex == 3)
            _buildText(context, 0.1, 0.6, labels[3], colors[2]),
          if (_currentIndex == 4)
            _buildText(context, 0.5, 0.5, labels[4], colors[2]),
          if (_currentIndex == 5)
            _buildText(context, 0.8, 0.6, labels[5], colors[2]),
          if (_currentIndex == 6)
            _buildText(context, 0.6, 0.45, labels[6], colors[2]),
          if (_currentIndex == 7)
            _buildText(context, 0.2, 0.5, labels[7], colors[2]),
          if (_currentIndex == 8)
            _buildText(context, 0.7, 0.3, labels[8], colors[2]),
        ],
      ),
    );
  }

  // Helper method to build text widgets at specified positions
  Widget _buildText(BuildContext context, double left, double top, String label,
      Color color) {
    return Positioned(
      left: MediaQuery.of(context).size.width * left,
      top: MediaQuery.of(context).size.height * top,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// CustomPainter to draw face analysis points and animation
class FaceAnalysisPointsPainter extends CustomPainter {
  final double animationValue; // Current value of the animation

  FaceAnalysisPointsPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Define the face boundaries
    final faceLeft = size.width * 0.1;
    final faceRight = size.width * 0.9;
    final faceTop = size.height * 0.15;
    final faceBottom = size.height * 0.7;

    // Paint for corner brackets
    final bracketPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw left top corner bracket
    canvas.drawLine(Offset(faceLeft, faceTop), Offset(faceLeft + 20, faceTop),
        bracketPaint);
    canvas.drawLine(Offset(faceLeft, faceTop), Offset(faceLeft, faceTop + 20),
        bracketPaint);

    // Draw right top corner bracket
    canvas.drawLine(Offset(faceRight, faceTop), Offset(faceRight - 20, faceTop),
        bracketPaint);
    canvas.drawLine(Offset(faceRight, faceTop), Offset(faceRight, faceTop + 20),
        bracketPaint);

    // Draw left bottom corner bracket
    canvas.drawLine(Offset(faceLeft, faceBottom),
        Offset(faceLeft + 20, faceBottom), bracketPaint);
    canvas.drawLine(Offset(faceLeft, faceBottom),
        Offset(faceLeft, faceBottom - 20), bracketPaint);

    // Draw right bottom corner bracket
    canvas.drawLine(Offset(faceRight, faceBottom),
        Offset(faceRight - 20, faceBottom), bracketPaint);
    canvas.drawLine(Offset(faceRight, faceBottom),
        Offset(faceRight, faceBottom - 20), bracketPaint);

    // Define points on the face
    final points = [
      Offset(size.width * 0.5, size.height * 0.25),
      Offset(size.width * 0.65, size.height * 0.25),
      Offset(size.width * 0.5, size.height * 0.5),
      Offset(size.width * 0.4, size.height * 0.45),
      Offset(size.width * 0.6, size.height * 0.45),
      Offset(size.width * 0.5, size.height * 0.55),
      Offset(size.width * 0.4, size.height * 0.65),
      Offset(size.width * 0.6, size.height * 0.65),
      Offset(size.width * 0.3, size.height * 0.4),
      Offset(size.width * 0.7, size.height * 0.4),
      Offset(size.width * 0.45, size.height * 0.7),
      Offset(size.width * 0.55, size.height * 0.7),
      Offset(size.width * 0.2, size.height * 0.55),
      Offset(size.width * 0.8, size.height * 0.55),
    ];

    // Calculate the Y position of the scan line
    final scanLineY = faceTop + (faceBottom - faceTop) * animationValue;
    final scanLinePaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw the scan line if within face boundaries
    if (scanLineY >= faceTop && scanLineY <= faceBottom) {
      canvas.drawLine(
        Offset(faceLeft, scanLineY),
        Offset(faceRight, scanLineY),
        scanLinePaint,
      );
    }

    // Paint for glowing effect
    final glowPaint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw glow lines around the scan line
    for (int i = 1; i <= 8; i++) {
      double offset = i * 2.0;
      if (scanLineY - offset >= faceTop && scanLineY + offset <= faceBottom) {
        canvas.drawLine(
          Offset(faceLeft, scanLineY - offset),
          Offset(faceRight, scanLineY - offset),
          glowPaint,
        );
        canvas.drawLine(
          Offset(faceLeft, scanLineY + offset),
          Offset(faceRight, scanLineY + offset),
          glowPaint,
        );
      }
    }

    // Draw points with pulsing effect
    for (int i = 0; i < points.length; i++) {
      final point = points[i];
      if (point.dx >= faceLeft &&
          point.dx <= faceRight &&
          point.dy >= faceTop &&
          point.dy <= faceBottom) {
        final pulseOffset = sin(animationValue * 2 + i * 0.5) * 0.5 + 0.5;

        // Define different sizes for the glow and dot based on index
        final glowSize = 8 * pulseOffset * (1 + i * 0.1); // Vary size by index
        final dotSize = 3 * (1 + i * 0.02); // Vary size by index

        final glowPaint = Paint()
          ..color = Colors.white.withOpacity(0.3 * pulseOffset)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(point, glowSize, glowPaint);

        final dotPaint = Paint()
          ..color = Colors.white.withOpacity(0.8 + (0.2 * pulseOffset))
          ..style = PaintingStyle.fill;
        canvas.drawCircle(point, dotSize, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
