import 'package:flutter/material.dart';

class CustomServiceItem extends StatefulWidget {
  const CustomServiceItem({Key? key, required this.imagePath, required this.serviceName}) : super(key: key);
  final String imagePath;
  final String serviceName;

  @override
  _CustomServiceItemState createState() => _CustomServiceItemState();
}

class _CustomServiceItemState extends State<CustomServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFEAEDF3),
            ),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width * 0.80,
            ),
          ),
          Expanded(child: Text(widget.serviceName)),
        ],
      ),
    );
  }
}
