import 'package:flutter/material.dart';

Widget radioButtonWithText(title, value, groupValue, function) => RadioListTile(
      activeColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: function,
    );
