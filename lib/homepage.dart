import 'package:flutter/material.dart';

import 'package:dart_ping/dart_ping.dart';

import 'package:iami_scanner/shared/responsive_screen_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponsiveScreenConfig responsiveScreenConfig = ResponsiveScreenConfig();
  final ping = Ping('192.168.100.232', count: 5);

  @override
  void initState() {
    ping.stream.listen((event) {
      print(event.response);
    });
    super.initState();
  }

  @override
  void dispose() async {
    ping.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveScreenConfig.initGetSize(context);

    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text("Test"),
        onPressed: () async {
          print('Running command: ${ping.command}');
          ping.;
        },
      )),
    );
  }
}
