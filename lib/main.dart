import 'package:flutter/material.dart';
import 'package:iami_scanner/features/login/presentation/screens/login_screen.dart';
import 'package:iami_scanner/features/scan_in.dart/presentation/screens/scan_in_inpur_detail_screen.dart';
import 'package:iami_scanner/features/scan_in.dart/presentation/screens/scan_in_input_screen.dart';
import 'package:iami_scanner/homepage.dart';
// import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((taskName, inputData) async {
//     print('Task eecuting $taskName');

//     return Future.value(true);
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Workmanager().initialize(
  //     callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode:
  //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );
  runApp(const IamiScanner());
}

class IamiScanner extends StatelessWidget {
  const IamiScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(color: Colors.white),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/scan-in-input': (context) => const ScanInInputScreen(),
        '/scan-in-detail': (context) => const ScanInInputDetailScreen(),
      },
    );
  }
}
