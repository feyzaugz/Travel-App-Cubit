import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgorundColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool isIcon;

  AppButton({
    required this.backgorundColor,
    this.text= "Hi",
    this.isIcon = false,
    this.icon,
    required this.color,
    required this.borderColor,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgorundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon == false
          ? Center(
            child: AppText(
                text: text!,
                color: color,
              ),
          )
          : Center(
            child: Icon(
                icon,
                color: color,
              ),
          ),
    );
    ;
  }
}
