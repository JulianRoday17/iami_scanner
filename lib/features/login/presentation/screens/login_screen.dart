import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:iami_scanner/homepage.dart';
import 'package:iami_scanner/utils/button_utils.dart';
import 'package:iami_scanner/utils/textfield_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'PT. ISUZU ASTRA MOTOR INDONESIA',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 50.0),
              outlinedTextfieldWithTitle('User'),
              const SizedBox(height: 10.0),
              outlinedTextfieldWithTitle('Password'),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  elevatedButton('Masuk', () {
                    Navigator.pushNamed(context, '/home');
                  }),
                  elevatedButton('Keluar', () => SystemNavigator.pop()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
