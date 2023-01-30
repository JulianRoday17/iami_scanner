import 'package:flutter/material.dart';
import 'package:iami_scanner/utils/alert_dialog.dart';
import 'package:iami_scanner/utils/button_utils.dart';
import 'package:iami_scanner/utils/label_utils.dart';
import 'package:iami_scanner/utils/widget_utils.dart';

class ScanInInputDetailScreen extends StatefulWidget {
  const ScanInInputDetailScreen({super.key});

  @override
  State<ScanInInputDetailScreen> createState() =>
      _ScanInInputDetailScreenState();
}

class _ScanInInputDetailScreenState extends State<ScanInInputDetailScreen> {
  String? status;
  String? dropDownSelected;

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 20.0),
            const Text('STATUS KONDISI:',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: radioButtonWithText("OKE", "OKE", status, (value) {
                    setState(() {
                      status = value;
                    });
                  }),
                ),
                Expanded(
                  child: radioButtonWithText("CDEL", "CDEL", status, (value) {
                    setState(() {
                      status = value;
                    });
                  }),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: radioButtonWithText("CPRO", "CPRO", status, (value) {
                    setState(() {
                      status = value;
                    });
                  }),
                ),
                Expanded(
                  child: radioButtonWithText("CRFK", "CRFK", status, (value) {
                    setState(() {
                      status = value;
                    });
                  }),
                ),
              ],
            ),
            radioButtonWithText("DINS", "DINS", status, (value) {
              setState(() {
                status = value;
              });
            }),
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 1, child: customLabelWithColon('CATATAN')),
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
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 1, child: customLabelWithColon('PARKIR')),
                const SizedBox(width: 10.0),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 20),
                    color: Colors.white,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              dropDownSelected = value;
                            });
                          },
                          value: dropDownSelected,
                          items: const [
                            DropdownMenuItem(
                              value: "A11",
                              child: Text("A1 | 1"),
                            ),
                            DropdownMenuItem(
                              value: "A12",
                              child: Text("A1 | 2"),
                            ),
                            DropdownMenuItem(
                              value: "A13",
                              child: Text("A1 | 3"),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                elevatedButton('SEBELUMNYA', () => Navigator.pop(context)),
                elevatedButton('KIRIM', () {
                  showDialog(
                      context: context,
                      builder: (context) => alertDialogWithTwobutton(
                              'Scan konfirmasi',
                              'Apakah anda yakin data ini sudah benar?', () {
                            Navigator.pop(context);

                            showDialog(
                              context: context,
                              builder: (context) => alertDialogWithOnebutton(
                                'Scan info',
                                'Silahkan langsung membawa unit ke lokasi parkir',
                                () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        alertDialogWithOnebutton(
                                      'Scan info',
                                      'Silahkan langsung membawa unit ke pemasangan aksesoris',
                                      () => Navigator.popUntil(context,
                                          ModalRoute.withName("/home")),
                                    ),
                                  );
                                },
                              ),
                            );
                          }, context));
                }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
