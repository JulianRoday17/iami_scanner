import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget outlinedTextfieldWithTitle(title) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
