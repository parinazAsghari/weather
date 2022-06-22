import 'package:flutter/material.dart';

class CustomTopSliderItem extends StatefulWidget {
  const CustomTopSliderItem({Key? key, required this.imagePath, required this.name, required this.model}) : super(key: key);
  final String imagePath;
  final String name;
  final String model;

  @override
  _CustomTopSliderItemState createState() => _CustomTopSliderItemState();
}

class _CustomTopSliderItemState extends State<CustomTopSliderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.red,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    // width: MediaQuery.of(context).size.width * 0.80,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.name,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  widget.model,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/pelak.jpg',
                    fit: BoxFit.fill,
                    // width:10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
