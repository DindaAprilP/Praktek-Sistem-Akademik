import 'matakuliah.dart';
import 'nilai.dart';

class KRS {
  List<MataKuliah> daftarMataKuliah = [];
  Map<String, Nilai> nilaiMataKuliah = {};

  void tambahMataKuliah(MataKuliah matakuliah) {
    daftarMataKuliah.add(matakuliah);
  }

  void inputNilai(MataKuliah matakuliah, String nilai) {
    nilaiMataKuliah[matakuliah.kode] = Nilai(matakuliah, nilai);
  }

  void cetakKRS() {
    print('Daftar Mata Kuliah yang Diambil:');
    for (var mk in daftarMataKuliah) {
      print('${mk.kode} - ${mk.nama} (${mk.sks} SKS)');
    }
  }

  void cetakTranskrip() {
    print('\nTranskrip Nilai:');
    double totalBobot = 0.0;
    int totalSKS = 0;

    for (var entry in nilaiMataKuliah.values) {
      var mk = entry.matakuliah;
      print('${mk.kode} - ${mk.nama} (${mk.sks} SKS) : ${entry.nilai}');
      totalBobot += entry.bobot * mk.sks;
      totalSKS += mk.sks;
    }

    double ipk = totalSKS > 0 ? totalBobot / totalSKS : 0.0;
    print('IPK: ${ipk.toStringAsFixed(2)}');
  }
}




