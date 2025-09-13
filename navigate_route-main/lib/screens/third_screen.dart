import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  static const routeName = '/third'; // Changed to unique route name
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final String itemId = args?['id'] ?? 'ไม่มี ID';
    final String pageTitle = args?['title'] ?? 'รายละเอียด';

    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ได้รับ: $itemId'),
            Text('ได้รับ: $pageTitle'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
