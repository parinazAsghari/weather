import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';

class CustomSubmitButton extends StatelessWidget {
  Function()? onTap;
  String? text;
  double? marginTop;
  double? marginBottom;
  double? marginRight;
  double? marginLeft;
  double? radiusSize;
  double? width;
  double? height;
  double? borderWidth;

  CustomSubmitButton({
    @required this.onTap,
    @required this.text,
    this.marginBottom = 8,
    this.marginLeft = 24,
    this.marginRight = 24,
    this.marginTop = 8,
    this.radiusSize = 8,
    this.width = double.infinity,
    this.height = 33 / 520,
    this.borderWidth = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).accentColor,
              // color: color_sharp_orange,
              width: borderWidth ?? 0),
          borderRadius: BorderRadius.all(
            Radius.circular(radiusSize ?? 0),
          ),
          color: Theme.of(context).accentColor,
          // color: color_sharp_orange
        ),
        width: width,
        height: MediaQuery.of(context).size.height * (height ?? 1),
        margin: EdgeInsets.only(
          right: marginRight ?? 0,
          left: marginLeft ?? 0,
          top: marginTop ?? 0,
          bottom: marginBottom ?? 0,
        ),
        child: Text(
          text ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
