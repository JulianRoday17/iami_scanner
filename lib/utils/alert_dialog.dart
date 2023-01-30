import 'package:flutter/material.dart';

Widget alertDialogWithOnebutton(title, content, function) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: function,
          child: const Text('OK'),
        )
      ],
    );

Widget alertDialogWithTwobutton(title, content, function, context) =>
    AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: function,
          child: const Text('YES'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('NO'),
        ),
      ],
    );
