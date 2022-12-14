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
  TextInputType? textInputType;
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
    this.textInputType,
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
        keyboardType: textInputType ?? TextInputType.text,
        // onChanged: (value){
        //   onChanged(value);
        // },
        textAlign: alignText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: alignText,
              style: TextStyle(color: Colors.black),
            ),
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
