import 'matakuliah.dart';

class Nilai {
  MataKuliah matakuliah;
  String nilai;
  late double bobot;

  Nilai(this.matakuliah, this.nilai) {
    bobot = _getBobot(nilai);
  }

  double _getBobot(String nilai) {
    switch (nilai) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        return 0.0;
    }
  }
}
