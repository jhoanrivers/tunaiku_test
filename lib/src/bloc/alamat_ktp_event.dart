


import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AlamatKtpEvent extends Equatable{


  @override
  List<Object> get props => [];
}

class SubmittedAlamat extends AlamatKtpEvent{
  final String alamatKtp;

  SubmittedAlamat({@required this.alamatKtp}) : assert(alamatKtp != null);

  @override
  List<Object> get props => [
    alamatKtp
  ];

}
