import 'package:flutter/material.dart';
import 'package:weird_wired/models/item.dart';
import 'package:weird_wired/widgets/left_drawer.dart';

class DetailItemPage extends StatelessWidget {
  final Item item;

  const DetailItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Amount: ${item.fields.amount}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Description:',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              item.fields.description,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to List'),
            ),
          ],
        ),
      ),
    );
  }
}