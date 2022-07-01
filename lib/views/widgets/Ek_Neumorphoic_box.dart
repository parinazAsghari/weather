
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

typedef VoidCallback = void Function();

class EkNeomorphicBox extends StatelessWidget {
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? paddingTop;
  final double? paddingBottom;
  final double? borderRadius;
  final double? fontSize;
  final double? depth;
  final double? height;
  final double? width;
  final bool isSquare;
  final bool isUnselectable;
  final Color color;

  const EkNeomorphicBox({
    required this.title,
    required this.onTap,
    this.borderRadius,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.fontSize = 14,
    this.depth = 1,
    required this.height,
    this.width,
    this.widget,
    this.isSquare = false,
    this.isUnselectable = false,
    this.color = Colors.white10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: isSquare ? height : width??double.maxFinite,
      child: NeumorphicButton(
        onPressed: isUnselectable?(){}:onTap,
        padding: EdgeInsets.only(
          top: paddingTop ?? 0,
          bottom: paddingBottom ?? 0,
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(borderRadius ?? 12),
          ),
          depth: depth,
          lightSource: LightSource.topLeft,
          color: Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: title.isNotEmpty
            ? Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
            : widget,
      ),
    );
  }
}
