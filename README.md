# weird_wired

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Tugas 7

## Perbedaan antara stateless dan stateful widget

_Stateless_ widget adalah widget yang state nya tidak dapat diubah setelah widget tersebut dibuat. Dengan kata lain, state dari widget ini immutable selama _runtime_ berlangsung. 

Sedangkan _stateful_ widget adalah widget yang state nya dapat diubah-ubah setelah widget tersebut dibuat, bahkan ketika _runtime_ berlangsung. State dari widget ini dapat berubah sesuai variable, input, atau data terkait.

Berikut beberapa perbedaan antara _stateless_ dan _stateful_ widget:

| _Stateless_ widget | _Stateful_ widget |
| :---: | :---: |
| Widget statis | Widget dinamis |
| Tidak bergantung pada data maupun perubahan _behaviour_ tertentu | Dapat mengalami perubahan ketika _runtime_ berlangsung, perubahan bisa berdasarkan perubahan data atau input dari user |
| Tidak memiliki _internal state_ | Memiliki _internal state_ |
| Hanya dirender satu kali dan setelah itu tidak dapat melakukan perubahan pada dirinya sendiri. Tetapi, widget ini masih bisa berubah berdasarkan perubahan data eksternal | Dapat me-render ulang dirinya sendiri ketika ada perubahan data atau perubahan _state_ |
| Override method `build()` dan me-return sebuah widget | Override method `createState()` dan me-return _state_ |

## Widget yang digunakan pada tugas ini
1. MaterialApp: untuk me-_wrap_ atau "membungkus" widget-widget yang dibutuhkan untuk design material suatu aplikasi.
2. Scaffold: untuk mengatur struktur layout dari suatu design material.
3. AppBar: berfungsi sebagai _toolbar_ yang menjadi wadah untuk beberapa widget di dalamnya.
4. SingleChildScrollView: suatu "box" untuk wadah suatu widget supaya widget tersebut dapat di-scroll apabila containernya terlalu sempit.
5. Padding: untuk memberikan inset kepada _child_ dari widget tersebut.
6. Column: untuk mendisplay _child_ dari widget tersebut secara vertikal.
7. Text: menampilkan suatu teks berupa string dengan _style_ tertentu.
8. GridView: sebuah 2D array yang terdiri dari widget-widget dan dapat di scroll. Main axis dari widget ini bergantung pada scrollDirection nya.
9. InkWell: membuat suatu area dari material menjadi responsif terhadap input berupa sentuhan layar.
10. Container: sebuah wadah untuk mengatur layout dari widget-widget di dalamnya, bisa digunakan untuk mengatur ukuran dan posisi widget.
11. SnackBar: memunculkan suatu _message_ tertentu di bagian bawah layar ketika terjadi suatu _action_ tertentu.
12. Center: menyesuaikan posisi wdiget-widget di dalamnya supaya berada di tengah.
13. Icon: menampilkan suatu icon non-interaktif.
14. EdgeInsets: untuk memberikan offset _immutable_ kepada 4 sisi dari sebuah _box_.
15. Material: berfungsi untuk memberikan _clipping_, _elevation_, dan _ink effects_ untuk _widget subtree_ nya.

## Langkah-langkah pengerjaan

1. Lewat command prompt, masuk ke direktori tempat menyimpan project flutter yang akan dibuat. Kemudian, jalankan perintah `flutter create weird_wired` pada cmd untuk menginisiasi project flutter baru sesuai nama project yang diinginkan. Kemudian coba menjalankan `flutter run` untuk memeriksa apakah demo project dapat berjalan dengan baik.

2. Masuk ke dalam direktori project, kemudian buka direktori weird_wired/lib. Masuk ke file `main.dart`, kemudian ubah isinya menjadi sebagai berikut:

```dart
import 'package:flutter/material.dart';
import 'package:weird_wired/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.shade300),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

   Pada `main.dart` ini, dibuat sebuah widget bernama MyApp yang merupakan stateless widget. Di dalam MyApp, dibuat sebuah design material untuk aplikasi ini menggunakan widget MateralApp.

2. Buat sebuah file baru dalam weird_wired/lib bernama `menu.dart`. Kemudian di dalamnya, isi dengan kode berikut:

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'WeirdWired', // Text yang menandakan inventory
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  // Iterasi untuk setiap item
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    }
}
```

   Pada kode tersebut, dibuat sebuah stateless widget baru bernama MyHomePage sebagai tampilan home page dari aplikasi ini. Layout pada MyHomePage diatur menggunakan widget scaffold. Pada grid view dalam widget tersebut, akan ada widget InventoryCards yang menampilkan cards berdasarkan item yang ada pada InventoryItem. Class InventoryItem dan InventoryClass akan dibuat pada langkah selanjutnya.

3. Pada `menu.dart`, buat sebuah class bernama InventoryItem untuk menyimpan cards yang ingin ditampilkan nantinya.

```dart
class InventoryItem {
  final String name;
  final IconData icon;

  InventoryItem(this.name, this.icon);
}
```

   Setelah itu, buat sebuah stateless widget baru bernama InventoryCard untuk menampilkan masing-masing card yang ada pada InventoryItem.

```dart
class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan.shade300,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
   Pada widget tersebut, di bagian onTap, terdapat SnackBar yang akan mengeluarkan message tertentu sesuai dengan card yang di-tap.

4. Pada widget MyHomePage, tambahkan sebuah list yang berisi cards yang ingin ditampilkan dengan menambahkan kode berikut setelah `MyHomePage({Key? key}) : super(key: key);` :

```dart
final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.checklist),
    InventoryItem("Tambah Item", Icons.backpack),
    InventoryItem("Logout", Icons.logout),
];
```
   Setiap cards dalam list tersebut nantinya akan ditampilkan pada widget InventoryCard.

