import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';

import 'package:dart_ping/dart_ping.dart';
import 'package:iami_scanner/features/scan_in.dart/presentation/screens/scan_in_input_screen.dart';
// import 'package:workmanager/workmanager.dart';

import 'package:iami_scanner/shared/responsive_screen_config.dart';
import 'package:iami_scanner/utils/button_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponsiveScreenConfig responsiveScreenConfig = ResponsiveScreenConfig();
  final ping = Ping('192.168.100.232', count: null);
  bool _enabled = true;
  int _status = 0;
  List<DateTime> _events = [];
  TextEditingController inputTargetController = TextEditingController();
  String statusConnection = '-';
  bool isConnected = false;

  @override
  void initState() {
    // initPlatformState();
    // ping.stream.listen((event) {
    //   print(event.response);
    // });
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
        ping;
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Menu Utama',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  elevatedButton('Scan In', () {
                    Navigator.pushNamed(context, '/scan-in-input');
                  }),
                  elevatedButton('Scan Out', () {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  elevatedButton('Insp Start', () {}),
                  elevatedButton('Insp End', () {})
                ],
              ),
              elevatedButton('Stock Opname', () {}),
              elevatedButton('Tutup', () {}),

              // Switch(value: _enabled, onChanged: _onClickEnable),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextField(
              //     controller: inputTargetController,
              //     decoration: InputDecoration(
              //         hintText: 'Input Target Here', border: OutlineInputBorder()),
              //   ),
              // ),
              // SizedBox(height: 100),
              // Text(statusConnection),
              // SizedBox(height: 10),

              // Container(
              //   height: 25,
              //   width: 25,
              //   color: isConnected ? Colors.green : Colors.red,
              // ),
              // SizedBox(height: 50),
              // ElevatedButton(
              // onPressed: () async {
              //   Ping pingStatus = Ping('google.com', count: null);

              //   pingStatus = Ping('8.8.8.8', count: null);

              //   // Begin ping process and listen for output
              //   pingStatus.stream.listen((event) {
              //     if (true) {
              //       print(event);
              //       setState(() {
              //         if (event.error == null) {
              //           statusConnection = event.response.toString();
              //           isConnected = true;
              //         } else {
              //           statusConnection = 'Timeout';
              //           isConnected = false;
              //         }
              //       });
              //     }
              //   });
              // },
              // child: Text('Connect')),

              // TextButton(
              //   child: Text("Test"),
              //   onPressed: () async {
              // BackgroundFetch.scheduleTask(TaskConfig(
              //     taskId: "com.transistorsoft.customtask",
              //     delay: 60000,
              //     periodic: true,
              //     forceAlarmManager: true,
              //     stopOnTerminate: true,
              //     startOnBoot: true,
              //     enableHeadless: true // <-- milliseconds
              //     ));
              // Workmanager().registerOneOffTask(
              //   "testtask",
              //   "pingTask",
              // );
              // print('Running command: ${ping.command}');
              // ping;
              //     final ping = Ping('google.com', count: null);

              //     // Begin ping process and listen for output
              //     ping.stream.listen((event) {
              //       if (true) {
              //         print(event);
              //       }
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
