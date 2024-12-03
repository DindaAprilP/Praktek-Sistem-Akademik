import 'dart:io';
import '../lib/akademik/mahasiswa.dart';
import '../lib/akademik/matakuliah.dart';
import '../lib/akademik/krs.dart';

List<MataKuliah> daftarMataKuliah = [
  MataKuliah('MK001', 'Matematika Diskrit', 3),
  MataKuliah('MK002', 'Pemrograman Web 2', 3),
  MataKuliah('MK003', 'Bahasa Inggris 3', 2),
  MataKuliah('MK004', 'Basis Data', 3),
  MataKuliah('MK005', 'Kewirausahaan', 3),
];

void main() {
  List<Mahasiswa> mahasiswaList = [];
  Map<String, KRS> krsMap = {};

  while (true) {
    print('\n| === SISTEM AKADEMIK MAHASISWA ===|');
    print('|----------------------------------|');
    print('|1.| Tambah Mahasiswa              |');
    print('|2.| Input Nilai Mahasiswa         |');
    print('|3.| Hitung IPK                    |');
    print('|4.| Cetak KRS                     |');
    print('|5.| Transkrip Nilai               |');
    print('|6.| Keluar                        |');
    print('|----------------------------------|');
    stdout.write('Pilih opsi: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1': 
        stdout.write('Masukkan NIM: ');
        String? nimInput = stdin.readLineSync();
        stdout.write('Masukkan Nama: ');
        String? namaInput = stdin.readLineSync();
        stdout.write('Masukkan Semester: ');
        int semesterInput = int.parse(stdin.readLineSync() ?? '0');

        if (nimInput == null || nimInput.isEmpty || namaInput == null || namaInput.isEmpty) {
          print('Data tidak valid, mahasiswa tidak dapat ditambahkan.');
          break;
        }

        Mahasiswa mahasiswa = Mahasiswa(nimInput, namaInput, semesterInput);
        mahasiswaList.add(mahasiswa);
        krsMap[nimInput] = KRS();
        print('Mahasiswa berhasil ditambahkan.');
        break;

      case '2': // Input Nilai Mahasiswa
        stdout.write('Masukkan NIM Mahasiswa: ');
        String? nimInput = stdin.readLineSync();
        if (nimInput == null || !krsMap.containsKey(nimInput)) {
          print('Mahasiswa tidak ditemukan!');
          break;
        }

        print('\nDaftar Mata Kuliah:');
        for (int i = 0; i < daftarMataKuliah.length; i++) {
          print(
              '${i + 1}. ${daftarMataKuliah[i].kode} - ${daftarMataKuliah[i].nama} (${daftarMataKuliah[i].sks} SKS)');
        }

        stdout.write('Pilih mata kuliah (1-${daftarMataKuliah.length}): ');
        int matkulIndex = int.parse(stdin.readLineSync() ?? '0') - 1;

        if (matkulIndex < 0 || matkulIndex >= daftarMataKuliah.length) {
          print('Pilihan mata kuliah tidak valid.');
          break;
        }

        MataKuliah mataKuliah = daftarMataKuliah[matkulIndex];
        stdout.write('Masukkan Nilai (A/B/C/D/E): ');
        String? nilaiInput = stdin.readLineSync();

        if (nilaiInput == null || nilaiInput.isEmpty) {
          print('Nilai tidak valid.');
          break;
        }

        KRS krs = krsMap[nimInput]!;
        krs.tambahMataKuliah(mataKuliah);
        krs.inputNilai(mataKuliah, nilaiInput);
        print('Nilai berhasil dimasukkan.');
        break;

      case '3': // Hitung IPK
        stdout.write('Masukkan NIM Mahasiswa: ');
        String? nimInput = stdin.readLineSync();
        if (nimInput == null || !krsMap.containsKey(nimInput)) {
          print('Mahasiswa tidak ditemukan!');
          break;
        }

        krsMap[nimInput]!.cetakTranskrip();
        break;

      case '4': // Cetak KRS
        stdout.write('Masukkan NIM Mahasiswa: ');
        String? nimInput = stdin.readLineSync();
        if (nimInput == null || !krsMap.containsKey(nimInput)) {
          print('Mahasiswa tidak ditemukan!');
          break;
        }

        krsMap[nimInput]!.cetakKRS();
        break;

      case '5': // Transkrip Nilai
        stdout.write('Masukkan NIM Mahasiswa: ');
        String? nimInput = stdin.readLineSync();
        if (nimInput == null || !krsMap.containsKey(nimInput)) {
          print('Mahasiswa tidak ditemukan!');
          break;
        }

        krsMap[nimInput]!.cetakTranskrip();
        break;

      case '6': // Keluar
        print('Keluar dari program.');
        exit(0);

      default:
        print('Pilihan tidak valid.');
    }
  }
}
