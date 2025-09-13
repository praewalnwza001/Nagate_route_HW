import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:navigate_route/screens/detail_screen.dart';
import 'package:navigate_route/data_provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ใช้ context.watch เพื่อรับค่าจาก Provider
    final message = context.watch<DataProvider>().message;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
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
                // ไปยังหน้า DetailScreen
                Navigator.of(context).pushNamed(DetailScreen.routeName);
              },
              child: const Text('Go to Detail Screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ใช้ context.read เพื่ออัปเดตข้อมูลใน Provider
          context.read<DataProvider>().updateMessage('this is data from home page');
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}