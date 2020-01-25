

import 'package:meta/meta.dart';

class DataSaved {

  String ktpNumber;
  String namaLengkap;
  String noRekening;
  String pendidikan;
  String tanggalLahir;
  String alamatKtp;
  String tempatTinggal;
  String provinsi;
  String noBlok;


  DataSaved({this.namaLengkap, this.pendidikan, this.tanggalLahir, this.ktpNumber, this.noRekening,this.alamatKtp,this.noBlok,this.provinsi,this.tempatTinggal});

  @override
  String toString() {
    return 'DataSaved{ktpNumber: $ktpNumber, namaLengkap: $namaLengkap, noRekening: $noRekening, pendidikan: $pendidikan, tanggalLahir: $tanggalLahir, alamatKtp: $alamatKtp, tempatTinggal: $tempatTinggal, provinsi: $provinsi, noBlok: $noBlok}';
  }


}