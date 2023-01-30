import 'package:flutter/material.dart';
import 'package:iami_scanner/features/scan_in.dart/presentation/screens/scan_in_inpur_detail_screen.dart';
import 'package:iami_scanner/utils/button_utils.dart';
import 'package:iami_scanner/utils/label_utils.dart';

class ScanInInputScreen extends StatelessWidget {
  const ScanInInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SCAN IN',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(flex: 1, child: customLabelWithColon('NIK')),
                const SizedBox(width: 10.0),
                const Flexible(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            customLabelWithColonWithText('NO. MESIN', 'Mesin A'),
            customLabelWithColonWithText('TIPE', 'Burner C'),
            customLabelWithColonWithText('WARNA', 'Biru'),
            customLabelWithColonWithText('ASAL', 'TAC 12'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                elevatedButton('TUTUP', () => Navigator.pop(context)),
                elevatedButton('SELANJUTNYA', () {
                  Navigator.pushNamed(context, '/scan-in-detail');
                }),
              ],
            )
          ],
        ),
      )),
    );
  }
}
