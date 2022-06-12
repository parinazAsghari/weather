import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class DescriptionBox extends StatelessWidget {
  String? title;
  String? desc;

  DescriptionBox({this.title, this.desc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 15, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height*0.17,
      decoration: BoxDecoration(
        border: Border.all(color: dark_theme_secondary, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            desc ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
