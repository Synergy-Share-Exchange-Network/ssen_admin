import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MLAttributeElements extends StatelessWidget {
  const MLAttributeElements(
      {Key? key, required this.title, required this.label})
      : super(key: key);
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: 20, // minimum width
              maxWidth: 70,
              minHeight: 20,
              maxHeight: 40 // maximum width
              ),
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
