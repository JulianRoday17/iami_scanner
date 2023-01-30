import 'package:flutter/material.dart';

Widget elevatedButton(title, function) => SizedBox(
      height: 70,
      width: 130,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
