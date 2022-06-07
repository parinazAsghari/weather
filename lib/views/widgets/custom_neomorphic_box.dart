import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';

class CustomNeomorphicBox extends StatelessWidget {
  String? title;
  bool isFull;
  bool isChildText;
  Widget? widget;
  int? index;
  int? selectedIndex;
  Function()? onTap;
  double? marginTop;
  double? marginBottom;
  double? marginRight;
  double? marginLeft;
  double? paddingRight;
  double? paddingLeft;
  double? paddingTop;
  double? paddingBottom;
  double? radiusSize;
  double? fontSize;
  double? depth;
  double height;

  CustomNeomorphicBox({
    @required this.title,
    @required this.index,
    @required required this.selectedIndex,
    required this.isFull,
    @required this.onTap,
    this.marginBottom = 8,
    this.marginLeft = 24,
    this.marginRight = 24,
    this.marginTop = 8,
    this.radiusSize = 12,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.fontSize = 14,
    this.depth = 8,
    required this.height,
    this.isChildText = true,
    this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginRight ?? 0, vertical: marginTop ?? 0),
     /* padding: EdgeInsets.symmetric(
          horizontal: paddingRight ?? 0, vertical: paddingTop ?? 0),*/
      height: MediaQuery.of(context).size.height * height,
      child: NeumorphicButton(
        onPressed: onTap,
        padding:  EdgeInsets.only(right: paddingRight??0, left:paddingLeft??0,top: paddingTop??0,bottom: paddingBottom??0,),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(radiusSize ?? 0),),
          depth: depth,
          lightSource: LightSource.topLeft,
          color: selectedIndex == index
              ? dark_theme_white_low
              : Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: isChildText
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontFamily: 'Vazir',
                      fontWeight: FontWeight.bold,
                      color: isFull ? dak_theme_box_shadow_dark : Colors.black,
                      fontSize: fontSize),
                ),
              )
            : widget,
      ),
    );
  }
}
