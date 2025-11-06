**Nama**: Farrel Augusta Dinata

**Kelas**: TI-3H

**NIM**: 2341720081

---

# Tugas Praktikum 1 - Mengunduh Data dari Web Service (API)

![1 - 1](docs/img/01/01.png)

![1 - 2](docs/img/01/02.png)

![1 - 3](docs/img/01/03.png)

![1 - 4](docs/img/01/04.png)

**Pertanyaan:**

1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda!

    Jawab: ![1 - 5](docs/img/01/05.png)

2. Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut!

    Jawab: Menambahkan buku dengan judul **Generative Deep Learning** yang diterbitkan oleh O'reilly dan dituliskan oleh **David Foster**.

    ID bukut: RKegDwAAQBAJ

    ![1 - 6](docs/img/01/06.png)

    ![1 - 7](docs/img/01/07.png)

    Hasil percobaan:

    ![1 - 8](docs/img/01/08.png)

3. Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!

    Jawab: 
    - Fungsi `substring()` : digunakan untuk mengambil sebagian dari keseluruhan data dalam string yang ada. Parameter dari substring adalah `start` dan `end` (opsional). Nilai dari parameter `start` digunakan untuk mengawali pada karakter mana data di string diambil. Jika pada parameter `end` tidak diberikan, maka akan mengambil data dari posisi `start` hingga akhir. Namun, jika `end` diberikan nilai, maka karakter yang diambil akan dihentikan sampai di titik situ saja.
    - Fungsi `catchError()` : ini digunakan untuk menangkap error yang terjadi dari proses asynchronous.

# Tugas Praktikum 2 - Menggunakan `async`/`await` untuk menghindari callbacks

![2 - 1](docs/img/02/01.png)

![2 - 2](docs/img/02/02.png)

![2 - 3](docs/img/02/03.png)

**Preview**

![week-11-practicum-2](https://github.com/user-attachments/assets/16cb2c4d-8700-4904-85b5-e9141b764076)


**Pertanyaan:**

1. Jelaskan maksud kode langkah 1 dan 2 tersebut!

    Jawab: Kode pada langkah 1 dan 2 merupakan contoh penggunaan proses **asynchronous** dengan menggunakan keywords `async` dan juga `await`. Dengan penggunaan keywords tersebut, maka sebuah proses tidak perlu menunggu saat ini selesai untuk mengeksekusi proses selanjutnya. Jika ditemukan proses saat ini membutuhkan sebuah delay dalam waktu tertentu, maka program akan otomatis beralih pada aktivitas selanjutnya selagi proses sebelumnya diproses.

# Tugas Praktikum 3 - Menggunakan `Completer` di `Future`

![3 - 1](docs/img/03/01.png)

![3 - 2](docs/img/03/02.png)

![3 - 3](docs/img/03/03.png)

![3 - 4](docs/img/03/04.png)

**Preview**

![week-11-practicum-3](https://github.com/user-attachments/assets/77e9ad2f-687c-48e9-b7b7-3a29189f4663)


**Pertanyaan:**

1. Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

    Jawab: Kode pada langkah 2 hanya mengatur 1 kondisi di dalam asynchronous, semuanya akan dianggap sukses. Sedangkan, pada langkah 5 dan juga 6 dia juga mengatur pada saat error.

    ```dart
    // ...

    try {
      await Future.delayed(const Duration(seconds: 5));
      _completer.complete(42);
    } catch (e) {
      _completer.completeError({});
    }

    //...
    ```
    Bagian `try-catch` tersebut yang membuat `completer` bisa digunakan untuk mengatur pada proses baik itu sukses ataupun error.


# Tugas Praktikum 4 - Memanggil `Future` secara parallel

![4 - 1](docs/img/04/01.png)

![4 - 2](docs/img/04/02.png)

![4 - 3](docs/img/04/03.png)

**Preview**

![week-11-practicum-4](https://github.com/user-attachments/assets/79d45235-90e0-403a-bc9e-8504ede50287)


**Pertanyaan:**

1. Jelaskan maksud perbedaan kode langkah 1 dan 4!

    Jawab: Perbedaan yang paling mencolok adalah gaya penulisan untuk mengatur asynchronous process dengan atau tanpa keyword `async / await`. Penulisan dengan cara `async/await` membuat kode masih menyerupai dengan kode Flutter pada umumnya. Namun, di sisi lain, penggunaan `FutureGroup` jauh lebih fleksibel apabila di suatu saat akan ada modifikasi dari kumpulan proses asynchronous saat ini. Untuk menambahkan asychronous baru, maka tinggal menggunakan fungsi `.add()`. 

# Tugas Praktikum 5 - Menangani Respon Error pada Async Code

![5 - 1](docs/img/05/01.png)

![5 - 2](docs/img/05/02.png)

![5 - 3](docs/img/05/03.png)

**Pertanyaan:**

1. Capture hasil praktikum Anda berupa GIF dan lampirkan di README!

    Jawab:

   ![week-11-practicum-5a](https://github.com/user-attachments/assets/e4824889-f93a-40d1-8236-e7e898f67c48)


3. Panggil method `handleError()` tersebut di `ElevatedButton`, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

    Jawab:

   ![week-11-practicum-5b](https://github.com/user-attachments/assets/84c9ac33-e782-46e0-bfd7-95ca65a6d722)


    Hasilnya sama saja antara percobaan pertama dan kedua ini. Hasilnya menunjukkan error yang memang sudah disengaja dari function `handleError()` itu sendiri. 
    
    ```dart
    throw Exception('Something terrible happened!');
    ```
    Bagian `throw Exception()` tersebut merupakan trigger yang membuat hasil yang ditampilkan berupa hasil error. Error pasti akan ditangkap pada bagian `catchError()` atau `catch` di struktur `try-catch-finally`.

    Perbedaan yang menonjol hanyalah pada pada gaya pembuatan kode. Langkah pertama implementasi dari function `handleError()` disusun dengan secara berantai (chaining).

    ```dart
    _returnError()
        .then((value) {
            setState(() {
            _result = 'Success!';
            });
        }).catchError((onError) {
            setState(() {
            _result = onError.toString();
            });
        }).whenComplete(() => print('Complete!'));
    ```
    Sedangkan untuk metode yang kedua ditulis dengan lebih menyerupai kode Flutter secara konvensional tanpa membuat callback pada tiap proses setelah asynchronous.
    
    ```dart
    try {
      await _returnError();
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    } finally {
      print('Complete!');
    }
    ```

# Tugas Praktikum 6 - Menggunakan Future dengan StatefulWidget

# Tugas Praktikum 7 - Manajemen Future dengan StatefulWidget

# Tugas Praktikum 8 - Navigation route dengan Future Function

# Tugas Praktikum 9 - Memanfaatkan `async/await` dengan Widget Dialog
