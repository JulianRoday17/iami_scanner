import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';

import 'package:dart_ping/dart_ping.dart';
// import 'package:workmanager/workmanager.dart';

import 'package:iami_scanner/shared/responsive_screen_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponsiveScreenConfig responsiveScreenConfig = ResponsiveScreenConfig();
  final ping = Ping('192.168.100.232', count: 5);
  bool _enabled = true;
  int _status = 0;
  List<DateTime> _events = [];

  @override
  void initState() {
    initPlatformState();
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

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      setState(() {
        _events.insert(0, new DateTime.now());
      });
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    });
    print('[BackgroundFetch] configure success: $status');
    setState(() {
      _status = status;
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void _onClickEnable(enabled) {
    setState(() {
      _enabled = enabled;
    });
    if (enabled) {
      BackgroundFetch.start().then((int status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((int status) {
        print('[BackgroundFetch] stop success: $status');
      });
    }
  }

  void _onClickStatus() async {
    int status = await BackgroundFetch.status;
    print('[BackgroundFetch] status: $status');
    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    responsiveScreenConfig.initGetSize(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Switch(value: _enabled, onChanged: _onClickEnable),
          TextButton(
            child: Text("Test"),
            onPressed: () async {
              BackgroundFetch.scheduleTask(TaskConfig(
                  taskId: "com.transistorsoft.customtask",
                  delay: 60000,
                  periodic: true,
                  forceAlarmManager: true,
                  stopOnTerminate: true,
                  startOnBoot: true,
                  enableHeadless: true // <-- milliseconds
                  ));
              // Workmanager().registerOneOffTask(
              //   "testtask",
              //   "pingTask",
              // );
              // print('Running command: ${ping.command}');
              // ping;
            },
          ),
        ],
      )),
    );
  }
}
