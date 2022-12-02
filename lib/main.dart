import 'package:flutter/material.dart';
import 'package:iami_scanner/homepage.dart';

void main() {
  runApp(const IamiScanner());
}

class IamiScanner extends StatelessWidget {
  const IamiScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
