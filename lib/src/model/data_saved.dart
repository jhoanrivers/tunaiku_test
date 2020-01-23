

import 'package:meta/meta.dart';

class DataSaved {

  String ktpNumber;
  String namaLengkap;
  String pendidikan;
  String tanggalLahir;

  DataSaved({this.namaLengkap, this.pendidikan, this.tanggalLahir, this.ktpNumber});

  @override
  String toString() {
    return 'DataSaved{ktpNumber: $ktpNumber, namaLengkap: $namaLengkap, pendidikan: $pendidikan, tanggalLahir: $tanggalLahir}';
  }


}