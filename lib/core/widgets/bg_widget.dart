import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_theme.dart';

class bg_widget extends StatelessWidget {
  bg_widget({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    bool isDark = AppTheme.isDark;
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(isDark
                    ? "assets/images/bg (1).png"
                    : "assets/images/default_bg.png"))),
        child: child);
  }
}
