import 'package:flutter/material.dart';

class NewMapPage extends StatefulWidget {
  const NewMapPage({Key? key}) : super(key: key);

  @override
  _NewMapPageState createState() => _NewMapPageState();
}

class _NewMapPageState extends State<NewMapPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'map',
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
