


import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AlamatKtpEvent extends Equatable{


  @override
  List<Object> get props => [];
}


class FetchProvinsi extends AlamatKtpEvent{}


class SubmittedAlamat extends AlamatKtpEvent{
  final String alamatKtp;
  final String tempatTinggal;
  final String provinsi;
  final String noBlok;


  SubmittedAlamat({
  @required this.tempatTinggal,
  @required this.provinsi,
  @required this.noBlok,
  @required this.alamatKtp
  }) : assert(alamatKtp != null);

  @override
  List<Object> get props => [
    alamatKtp, tempatTinggal, provinsi, noBlok
  ];

}
