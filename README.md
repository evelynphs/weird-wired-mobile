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

