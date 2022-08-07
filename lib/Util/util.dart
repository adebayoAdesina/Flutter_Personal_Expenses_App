import 'package:flutter/material.dart';

showSnapBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

alertDialog(String content, BuildContext context) {
  AlertDialog(
    title: Text(content),
    actions: [
      Row(
        children: [
          CircleAvatar(child: Text('X')),
          IconButton(onPressed: () {}, icon: Icon(Icons.done))
        ],
      )
    ],
  );
}
