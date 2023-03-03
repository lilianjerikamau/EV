import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
class DetailScreen extends StatefulWidget {
  final String imagePath;

  const DetailScreen({required this.imagePath});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// Helps in painting the bounding boxes around the recognized
// email addresses in the picture
class TextDetectorPainter extends CustomPainter {
  TextDetectorPainter(this.absoluteImageSize, this.elements);

  final Size absoluteImageSize;
  final List<TextElement> elements;

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    Rect scaleRect(TextElement container) {
      return Rect.fromLTRB(
        container.boundingBox.left * scaleX,
        container.boundingBox.top * scaleY,
        container.boundingBox.right * scaleX,
        container.boundingBox.bottom * scaleY,
      );
    }

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 2.0;

    for (TextElement element in elements) {
      canvas.drawRect(scaleRect(element), paint);
    }
  }

  @override
  bool shouldRepaint(TextDetectorPainter oldDelegate) {
    return true;
  }
}