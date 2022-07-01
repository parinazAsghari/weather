

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/widgets/Ek_Neumorphoic_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomItemButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final double width;
  final double imageHeight;
  final double? buttonHeight;
  final double height;
  final double horizontalPadding;
  final Function()? onTap;

  const CustomItemButton({
    required this.title,
    final this.imagePath = 'assets/images/ic_news.png',
    this.width = 90.0,
    this.height = 90.0,
    this.imageHeight = 65,
    this.buttonHeight,
    this.horizontalPadding = 8.0,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EkNeomorphicBox(
            depth: 1,
            title: '',
            borderRadius: defaultBorderRadius,
            widget: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fitWidth,
                  height: imageHeight,
                ),
              ),
            ),
            onTap: onTap,
            isSquare: true,
            height: buttonHeight ?? 80,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
