


import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DataDiriEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class Submitted extends DataDiriEvent{

  final String ktpNumber;
  final String namaLengkap;
  final String noRekening;
  final String pendidikan;
  final String tanggalLahir;

  Submitted({
    @required this.noRekening,
    @required this.namaLengkap,
    @required this.pendidikan,
    @required this.tanggalLahir,
    @required this.ktpNumber}
    );

  @override
  List<Object> get props =>[
    ktpNumber,
    namaLengkap,
    noRekening,
    pendidikan,
    tanggalLahir
  ];


}

