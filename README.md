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

<details>
<summary>Tugas 7</summary>
<br>

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

</details>

# Tugas 8

## Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`

`Navigator.push()` akan meletakkan atau "menumpuk" suatu _route_ ke dalam _stack route_ tanpa melakukan perubahan apapun pada _route_ yang sudah ada pada _stack route_. Sedangkan `Navigator.pushReplacement()` akan "mengeluarkan" _route_ lama yang ada pada bagian paling atas dari tumpukkan _stack route_, kemudian memasukkan _route_ baru dan menjadikannya _route_ paling atas pada _stack_. Jadi, `Navigator.push()` hanya akan **menambahkan** suatu _route_ baru pada _stack_, sedangkan `Navigator.pushReplacement()` akan **mengganti** _route_ paling atas pada suatu _stack_ dengan _route_ yang baru.

Contoh:
Misalnya, pada suatu _stack route_, kondisi awal _stack_ adalah sebagai berikut

`stack = [MyHomePage, InventoryHomePage]`

Jika kita berpindah ke halaman ListPage dengan menggunakan perintah **push** seperti berikut
```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
```
maka, kondisi _stack route_ sekarang adalah
`stack = [MyHomePage, InventoryHomePage, ListPage]`.

Namun, jika kita berpindah halaman ke ListPage menggunakan **pushReplacement** seperti berikut
```dart
Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPage(),
                  ));
```
maka, kondisi _stack route_ sekarang adalah
`stack = [MyHomePage, ListPage]`.

## Macam-macam layout widget pada Flutter dan konteks penggunaannya

Beberapa jenis layout pada flutter yang biasa/sering digunakan antara lain:

1. Container: di dalamnya terdapat single child widget. Container digunakan untuk mengatur layout child widget di dalamnya dengan menambahkan margin, padding, border, dan warna background.

2. GridView: untuk mengatur layout child widget di dalamnya sebagai 2D list. 

3. ListView: untuk mengatur layout child widget di dalamnnya dengan format seperti suatu kolom. Apabila konten di dalamnya terlalu besar, maka ListView akan otomatis membuat layoutnya menjadi scrollable. Dapat diatur untuk menampilkan layout secara horizontal maupun vertikal.

4. Stack: untuk _overlap_ suatu widget di atas widget lainnya.

5. Card: digunakan untuk menampilkan sebuah layout berbentuk seperti kartu yang biasanya mengandung beberapa informasi kecil terkait sesuatu. Memiliki single child widget di dalamnya.

6. ListTile: untuk menampilkan suatu layout baris dengan jumlah baris maksimal 3. Biasanya digunakan untuk menampilkan suatu informasi berupa teks dengan icon di sebelahnya.

## Elemen input pada form yang digunakan pada tugas
Pada tugas ini, elemen input yang digunakan pada form adalah `TextFormField`, yaitu widget yang menyediakan tempat untuk input berupa teks. Pada project ini, `TextFormField` digunakan untuk mengambil input dari user berupa data nama, jumlah, dan deskripsi suatu Item. Ketiga data tersebut merupakan data berupa teks sehingga pada tugas ini, elemen input yang diperlukan hanya `TextFormField`. 

## Penerapan clean architecture pada aplikasi Flutter
_Clean architecture_ merupakan arsitektur suatu sistem yang menggunakan prinsip _separation of concerns_. Arsitektur ini membagi suatu _software_ menjadi beberapa bagian dengan tujuan mempermudah pengembangan dan _maintenance_ untuk _software_ tersebut. Pada flutter, _clean architecture_ dibagi menjadi beberapa _layer_ sebagai berikut:

1. Feature layer atau presentation layer:
Merupakan bagian dari _software_ yang terdiri dari komponen-komponen _user interface_ (UI) yang akan ditampilkan pada layar seperti widget. Layer ini akan meng-_handle_ interaksi user dengan _software_ dan meng-_handle_ render untuk UI.

2. Domain layer:
Merupakan layer _business logic_ suatu _software_. Terdiri dari _use cases_ (operasi-operasi yang dapat dilakuikan dalam suatu aplikasi), _entities_(objek dalam aplikasi), dan _repository interface_. Layer ini sepenuhnya terdiri dari program Dart tanpa elemen flutter apapun, tujuannya agar layer ini fokus sepenuhnya pada _business logic_ dari aplikasi.

3. Data layer:
Merupakan bagian dari aplikasi yang bertugas untuk mengambil dan menyimpan data. Terdiri dari repositori dan sumber data seperti database. Repositori digunakan untuk mengakses dan memanipulasi data, sedangkan database merupakan tempat penyimpanan data itu sendiri.

## Langkah-langkah pengerjaan

### 1. Membuat halaman formulir untuk menambahkan item baru

Pada direktori `weird_wired/lib/screens`, buat sebuah file baru bernama `inventory_form.dart`. Isi file tersebut dengan kode berikut:
```dart
import 'package:flutter/material.dart';
import 'package:weird_wired/widgets/left_drawer.dart';

class InventoryFormPage extends StatefulWidget {
    const InventoryFormPage({super.key});

    @override
    State<InventoryFormPage> createState() => _InventoryFormPageState();
}

class _InventoryFormPageState extends State<InventoryFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _name = "";
    int _amount = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Item',
            ),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ),
        // Masukkan drawer
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Item",
                  labelText: "Nama Item",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Jumlah",
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _amount = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Jumlah tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Jumlah harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyan),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
      );
    }
}
```
Di dalam bagian `Scaffold`, terdapat bagian `Form`, dan di dalam `Form` tersebut terdapat komponen `children` yang berisi list widget-widget dari `Form`. Di dalam list tersebut, terdapat tiga buah `Padding` yang di dalamnya terdapat masing-masing satu `TextFormField`. `TextFormField` pertama merupakan kolom input nama item, `TextFormField` kedua merupakan kolom input jumlah item, sedangkan `TextFormField` ketiga merupakan kolom input deskripsi item. Ketiga kolom input tersebut disesuaikan dengan field data pada model `Item` yang ada pada aplikasi Django yang telah dibuat sebelumnya.

Pada setiap `TextFormField`, terdapat validator yang akan memeriksa validasi dari data yang diinput. Validator tersebut akan mengeluarkan _alert_ apabila kolom input nya kosong atau input berisi data yang tidak sesuai dengan tipe data atribut modelnya.

Di akhir form, terdapat juga sebuah child berupa widget `Align` yang memiliki widget `ElevatedButton` di dalamnya, di mana button ini merupakan tombol save. Dalam widget tersebut, terdapat juga fungsi `onPressed` yang akan memunculkan suatu pop-up dialog box apabila tombol save ditekan. Dalam dialog box tersebut, terdapat tiga widget `Text` yang akan memunculkan informasi berupa nama, jumlah, dan deskripsi dari item yang baru saja di save.

### 2. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama

Pada `menu.dart`, di dalam class `InventoryCard`, terdapat fungsi `onTap()`. Dalam fungsi tersebut, tambahkan routing untuk button bernama "Tambah Item" dengan kode sebagai berikut:

```dart
...
onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Tambahkan kode berikut ini
          if (item.name == "Tambah Item") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryFormPage()));
          }
        }
...
```

### 3. Membuat sebuah drawer pada aplikasi dengan opsi "Halaman Utama" dan "Tambah Item"

Dalam direktori `weird_wired/lib`, buat sebuah direktori baru bernama `widgets`. Dalam direktori `widgets` tersebut, buat sebuah file baru bernama `left_drawer.dart`. Di dalam file tersebut, tambahkan kode sebagai berikut:

```dart
import 'package:flutter/material.dart';
import 'package:weird_wired/screens/menu.dart';
import 'package:weird_wired/screens/inventory_form.dart';

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
        ],
      ),
    );
  }
}
```

Susunan opsi pada drawer tersebut menggunakan `ListTile`. Pada `ListTile` pertama, terdapat opsi "Halaman Utama" yang di-_route_ ke `MyHomePage()`. Sedangkan pada `ListTile` kedua, terdapat opsi "Tambah Item" yang di-_route_ ke `InventoryFormPage()`. Kedua _routing_ tersebut menggunakan pushReplacement.

</details>

<details>
<summary>Tugas 9</summary>
<br>

# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu?
Bisa, kita bisa mengambil data JSON dengan cara "parsing", dan hal ini dapat dilakukan tanpa membuat model terlebih dahulu. Namun, hal ini tidak disarankan untuk data dalam jumlah banyak dan project yang lebih kompleks. Pembuatan model disarankan agar representasi data menjadi lebih terstruktur.

## Fungsi dari CookieRequest dan pentingnya pembagian instance CookieRequest ke semua komponen di aplikasi Flutter
CookieRequest digunakan sebagai akses pada suatu komponen aplikasi untuk meminta HTTP _request_ yang menyertakan cookie. Intace CookieRequest ini penting untuk dibagikan ke seluruh komponen aplikasi untuk menjaga konsistensi data cookie yang dikelola oleh setiap komponen. Hal ini akan mempermudah koordinasi dan pertukaran data cookie antar komponen.

## Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter
Data akan diambil menggunakan HTTP request GET, kemudian data akan di-decode menjadi bentuk JSON. Kemudian data berupa JSON tersebut akan dikonversi menjadi bentuk object yang dapat dibaca oleh flutter. Data dari objek tersebut dapat ditampilkan menggunakan widget pada flutter.

## Mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter
Flutter akan menerima input berupa username dan password dari user. Kemudian, input tersebut akan dikirimkan ke server django yang telah terhubung dengan project flutter tersebut. Input akan dikirimkan ke url yang mengarah pada sistem login atau sistem autentikasi pada srver django. Django kemudian akan melakukan autentikasi atau validasi berdasarkan input username dan password tersebut. Jika autentikasi berhasil, django akan mengirimkan respon sukses pada flutter, dan flutter akan menampilkan menu yang dapat ditampilkan jika user sudah login. Namun, jika autentikasi gagal, django akan mengirimkan respon gagal pada flutter dan menu tersebut tidak akan ditampilkan.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing

1. Provider: untuk menyimpan state dari user.

2. ElevatenButton: untuk membuat suatu button dengan fungsi tertentu yang akan dijalankan ketika button di-klik.

3. TextFormField: untuk menerima input berupa teks dari pengguna.

4. ListTile: untuk menampilkan suatu layout baris dengan jumlah baris maksimal 3. Biasanya digunakan untuk menampilkan suatu informasi berupa teks dengan icon di sebelahnya.

5. Container: di dalamnya terdapat single child widget. Container digunakan untuk mengatur layout child widget di dalamnya dengan menambahkan margin, padding, border, dan warna background.

## Langkah-langkah pengerjaan

