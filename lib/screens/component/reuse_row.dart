import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  final icons;
  String title;
  String descp;
  Reuseable({
    super.key,
    required this.icons,
    required this.title,
    required this.descp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(child: Text(descp))
      ],
    );
  }
}
