import 'package:flutter/material.dart';
import 'package:weird_wired/screens/menu.dart';
import 'package:weird_wired/screens/inventory_form.dart';
import 'package:weird_wired/screens/list_item.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: Column(
              children: [
                Text(
                  'WeirdWired',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Store the items you've collected from The Wired here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.backpack),
            title: const Text('Tambah Item'),
            // Bagian redirection ke InventoryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventoryFormPage(),
                  ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Daftar Item'),
              onTap: () {
                  // Route menu ke halaman produk
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ItemPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}