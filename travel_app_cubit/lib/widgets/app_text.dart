import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String
      text; //Bu değişkenler, bir kez değer atandıktan sonra başka bir değer atanamaz.
  final Color color;

  AppText({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
