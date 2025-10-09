**Nama**: Farrel Augusta Dinata

**Kelas**: TI-3H

**NIM**: 2341720081

---

# Tugas Praktikum 1

**Langkah 1 - Membuat Proyek Flutter Baru**

![1 - 1](docs/img/practicum-01/01.png)

**Langkah 2 - Menambahkan Plugin**

![1 - 2](docs/img/practicum-01/02.png)

![1 - 3](docs/img/practicum-01/03.png)

Langkah ke-2 bertujuan untuk menambahkan package baru dari internet ke proyek Flutter yang sedang dimiliki saat ini. Flutter sendiri sudah memiliki repositori tersendiri untuk menyimpan package-package yang bisa digunakan pada proyek Dart atau Flutter. Pihak Flutter menyediakan pada website `pub.dev`.

**Langkah 3 - Membuat Widget `red_text_widget.dart`**

![1 - 4](docs/img/practicum-01/04.png)

**Langkah 4 - Tambah Widget `AutoSizeText`**

![1 - 5](docs/img/practicum-01/05.png)

**Langkah 5 - Membuat Variabel `text` dan parameter di constructor**

![1 - 6](docs/img/practicum-01/06.png)

Pembuatan kode di atas bertujuan agar widget bisa menerima input teks ketika class widget tersebut dipanggil. Input ini akan ditaruh pada parameter constructor widget. Contohnya seperti ini:
```dart
RedTextWidget(text: 'Saya teks 1')


RedTextWidget(text: 'Saya teks 2')


RedTextWidget(text: 'Saya teks 3')
```

**Langkah 6 - Menambahkan Widget di `main.dart`**

![1 - 7](docs/img/practicum-01/07.png)

![1 - 8](docs/img/practicum-01/08.png)

Kode pada langkah 6 ini memanggil widget yang telah dibuat sebelumnya dan akan digunakan pada halaman utama aplikasi. Perbedaannya hanya terletak pada hasil tampilan aplikasi. Warna dan teks yang dimiliki berbeda. 

