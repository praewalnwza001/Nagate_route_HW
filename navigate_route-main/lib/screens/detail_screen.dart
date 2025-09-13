import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:navigate_route/data_provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ใช้ context.watch เพื่อรับค่าจาก Provider
    final message = context.watch<DataProvider>().message;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // แสดงข้อความที่ได้รับจาก Provider
            Text(
              message.isEmpty ? 'No data received' : message,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 1. ส่งค่าไปยัง Provider
                context.read<DataProvider>().updateMessage(
                  'this is data from detail page',
                );

                // 2. นำทางกลับไปยังหน้า Home Screen
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
