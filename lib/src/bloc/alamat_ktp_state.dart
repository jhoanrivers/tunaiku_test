

import 'package:equatable/equatable.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';

abstract class AlamatKtpState extends Equatable{


  @override
  List<Object> get props => [];
}


class AlamatKtpInitialState extends AlamatKtpState{}

class AlamatKtpLoadingState extends AlamatKtpState{}

class AlamatKtpSuccessState extends AlamatKtpState{
  final List<SemuaProvinsi> provs;

  AlamatKtpSuccessState({this.provs});

  @override
  List<Object> get props => [provs];

}

class AlamatKtpAfterDataValidState extends AlamatKtpState{
  final bool isValide;

  AlamatKtpAfterDataValidState({this.isValide});


  @override
  List<Object> get pops => [isValide];
}


class AlamatKtpErrorState extends AlamatKtpState{}