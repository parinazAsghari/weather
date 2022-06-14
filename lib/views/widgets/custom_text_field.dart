import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @required
  String title;
  String hintText;
  double height;
  TextEditingController controller;
  bool enabled;
  double? marginTop;
  double? marginBottom;
  double? marginRight;
  double? marginLeft;
  double? paddingRight;
  double? radius;
  IconData? iconData;
  bool isLtr;
  TextAlign alignText;
  var onChanged;

  CustomTextField({
    required this.title,
    this.hintText = '',
    required this.height,
    required this.controller,
    this.enabled = true,
    this.marginBottom = 0,
    this.marginLeft = 24,
    this.marginRight = 24,
    this.marginTop = 8,
    this.paddingRight = 10,
    this.radius = 8,
    this.iconData,
    this.onChanged,
    this.isLtr = false,
    this.alignText = TextAlign.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight ?? 0, left: marginLeft ?? 0, top: marginTop ?? 0, bottom: marginBottom ?? 0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        // onChanged: (value){
        //   onChanged(value);
        // },
        textAlign: alignText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          label: Text(
            title,
            textAlign: alignText,
          ),
          isDense: true,
          contentPadding: EdgeInsets.only(top: height, right: paddingRight ?? 0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
        ),
      ),
    );
  }
}
