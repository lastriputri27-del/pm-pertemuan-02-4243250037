# Tugas Rutin 2 — Kasir Console Dart

## Identitas
- Nama: Lastri P. Silaban
- NIM: 4243250037
- Mata Kuliah: Pemrograman Mobile

## Deskripsi Program
Program Kasir Console dibuat menggunakan bahasa pemrograman Dart. Program ini menyediakan katalog produk, menerima input pesanan, menghitung subtotal dan diskon, serta menampilkan struk belanja.

## Fitur Program
1. Katalog terdiri dari lima produk dengan kode, nama, harga, dan kategori.
2. Input pesanan menggunakan format `P01x2, P05x1`.
3. Pemrosesan pesanan menggunakan `split()`, `trim()`, dan `int.tryParse()`.
4. Kode produk atau jumlah yang tidak valid ditangani tanpa langsung menghentikan program.
5. Subtotal dihitung menggunakan `fold()`.
6. Diskon 10% diberikan jika subtotal mencapai Rp100.000.
7. Kategori produk unik dikumpulkan menggunakan `Set`.
8. Struk menampilkan rincian belanja, subtotal, diskon, total bayar, dan kategori.

## Skenario Pengujian

### Skenario 1 — Belanja di bawah Rp100.000
Input:
`P01x2, P05x1`

Perhitungan:
- Buku Tulis: 2 × Rp5.000 = Rp10.000
- Botol Minum: 1 × Rp25.000 = Rp25.000
- Subtotal: Rp35.000
- Diskon: Rp0
- Total bayar: Rp35.000

Hasil yang diharapkan: program menampilkan struk dengan total bayar Rp35.000 tanpa diskon.

### Skenario 2 — Belanja minimal Rp100.000
Input:
`P04x2, P05x2`

Perhitungan:
- Tas: 2 × Rp85.000 = Rp170.000
- Botol Minum: 2 × Rp25.000 = Rp50.000
- Subtotal: Rp220.000
- Diskon 10%: Rp22.000
- Total bayar: Rp198.000

Hasil yang diharapkan: program memberikan diskon 10% dan menampilkan total bayar Rp198.000.

## Penjelasan Variabel dan Null Safety

### `var`
Digunakan ketika tipe variabel dapat disimpulkan oleh Dart dan nilainya mungkin perlu berubah.

### `final`
Digunakan untuk variabel yang hanya boleh diberi nilai satu kali, misalnya katalog atau hasil input yang tidak perlu ditetapkan ulang.

### `const`
Digunakan untuk nilai konstan yang diketahui saat kompilasi. Pada versi program ini, `const` belum digunakan.

### Null Safety
`stdin.readLineSync() ?? ''` menggunakan nilai string kosong jika input yang diterima bernilai null.

`int.tryParse()` menghasilkan null jika teks tidak dapat dikonversi menjadi bilangan bulat. Program memeriksa hasil tersebut sebelum menggunakannya.

Operator `!` menyatakan bahwa nilai dianggap tidak null. Penggunaannya harus didukung oleh validasi sebelumnya agar risiko error dapat dikurangi.

## Pemeriksaan Program
Program diperiksa menggunakan:
- `dart format .`
- `dart analyze`
- `dart run`

## Teknologi
- Bahasa: Dart
- Editor: Visual Studio Code