import 'package:waiters/model/product.dart';

class Struck {
  String kodeTransaksi;
  List<Product> daftarBarang;
  final num uangMasuk;
  num totalPembayaran;
  num kembalian;
  
  String get statusPembyaran{
    bool status = uangMasuk == null ? false: true;
    return status ? "Lunas": "Belum Dibayar"; 
  } 
  DateTime get tanggal {
    return DateTime.now();
  }

  Struck({this.kodeTransaksi, this.daftarBarang, this.totalPembayaran, this.uangMasuk, this.kembalian});

}