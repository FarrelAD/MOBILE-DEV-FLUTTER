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

**Pertanyaan:**

1. Jelaskan maksud kode langkah 1 dan 2 tersebut!

    Jawab: Kode pada langkah 1 dan 2 merupakan contoh penggunaan proses **asynchronous** dengan menggunakan keywords `async` dan juga `await`. Dengan penggunaan keywords tersebut, maka sebuah proses tidak perlu menunggu saat ini selesai untuk mengeksekusi proses selanjutnya. Jika ditemukan proses saat ini membutuhkan sebuah delay dalam waktu tertentu, maka program akan otomatis beralih pada aktivitas selanjutnya selagi proses sebelumnya diproses.

# Tugas Praktikum 3 - Menggunakan `Completer` di `Future`

![3 - 1](docs/img/03/01.png)

![3 - 2](docs/img/03/02.png)

![3 - 3](docs/img/03/03.png)

![3 - 4](docs/img/03/04.png)

# Tugas Praktikum 4 - Memanggil `Future` secara parallel

![4 - 1](docs/img/04/01.png)

![4 - 2](docs/img/04/02.png)

![4 - 3](docs/img/04/03.png)
