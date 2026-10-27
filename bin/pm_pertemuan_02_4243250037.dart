import 'dart:io';

void main(List<String> arguments) {
  // Katalog produk: kode, nama, harga, dan kategori.
  final Map<String, Map<String, dynamic>> katalog = {
    'P01': {'nama': 'Buku Tulis', 'harga': 5000, 'kategori': 'Alat Tulis'},
    'P02': {'nama': 'Pulpen', 'harga': 3000, 'kategori': 'Alat Tulis'},
    'P03': {'nama': 'Pensil', 'harga': 2000, 'kategori': 'Alat Tulis'},
    'P04': {'nama': 'Tas', 'harga': 85000, 'kategori': 'Aksesori'},
    'P05': {'nama': 'Botol Minum', 'harga': 25000, 'kategori': 'Aksesori'},
  };

  print('=== KASIR CONSOLE ===');
  print('\nKATALOG PRODUK');

  for (final entry in katalog.entries) {
    final produk = entry.value;
    print(
      '${entry.key} | ${produk['nama']} | '
      'Rp${produk['harga']} | ${produk['kategori']}',
    );
  }

  print('\nContoh pesanan: P01x2, P05x1');
  stdout.write('Masukkan pesanan: ');
  final input = stdin.readLineSync() ?? '';

  final Map<String, int> pesanan = {};

  for (final item in input.split(',')) {
    final bagian = item.trim().toUpperCase().split('X');

    if (bagian.length != 2) {
      print('Format pesanan tidak valid: $item');
      continue;
    }

    final kode = bagian[0].trim();
    final jumlah = int.tryParse(bagian[1].trim());

    if (!katalog.containsKey(kode)) {
      print('Kode produk tidak ditemukan: $kode');
      continue;
    }

    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid untuk produk $kode');
      continue;
    }

    pesanan[kode] = (pesanan[kode] ?? 0) + jumlah;
  }

  if (pesanan.isEmpty) {
    print('\nTidak ada pesanan valid.');
    return;
  }

  // Menghitung subtotal menggunakan fold.
  final subtotal = pesanan.entries.fold<int>(
    0,
    (total, item) => total + (katalog[item.key]!['harga'] as int) * item.value,
  );

  final diskon = subtotal >= 100000 ? subtotal * 0.10 : 0.0;
  final totalBayar = subtotal - diskon;

  // Set menyimpan kategori yang unik.
  final Set<String> kategoriUnik = pesanan.keys
      .map((kode) => katalog[kode]!['kategori'] as String)
      .toSet();

  print('\n========== STRUK BELANJA ==========');

  for (final item in pesanan.entries) {
    final produk = katalog[item.key]!;
    final harga = produk['harga'] as int;
    final jumlah = item.value;
    final totalItem = harga * jumlah;

    print(
      '${item.key} - ${produk['nama']} x$jumlah = '
      'Rp$totalItem',
    );
  }

  print('-----------------------------------');
  print('Subtotal   : Rp${subtotal.toStringAsFixed(0)}');
  print('Diskon     : Rp${diskon.toStringAsFixed(0)}');
  print('Total bayar: Rp${totalBayar.toStringAsFixed(0)}');
  print('Kategori   : ${kategoriUnik.join(', ')}');
  print('===================================');
}
