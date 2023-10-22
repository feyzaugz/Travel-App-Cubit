import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String
      text; //Bu değişkenler, bir kez değer atandıktan sonra başka bir değer atanamaz.
  final Color color;

  AppLargeText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
