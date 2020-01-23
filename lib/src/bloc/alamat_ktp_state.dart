

import 'package:equatable/equatable.dart';

abstract class AlamatKtpState extends Equatable{


  @override
  List<Object> get props => [];
}


class AlamatKtpInitialState extends AlamatKtpState{}

class AlamatKtpSuccessState extends AlamatKtpState{
  

}

class AlamatKtpErrorState extends AlamatKtpState{}