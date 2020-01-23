import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  final List mProps;
  RegisterState([this.mProps = const []]);

  @override
  List<Object> get props => this.mProps;
}

class DataDiriInitial extends RegisterState{}

class DataDiriLoading extends RegisterState{}

class DataDiriSuccess extends RegisterState{

  final bool isValidate;

  DataDiriSuccess({this.isValidate});

  @override
  List<Object> get props =>[isValidate];


}

class DataDiriError extends RegisterState{

  final String dataIsNotValidate;

  DataDiriError({this.dataIsNotValidate});

  @override
  List<Object> get props => [dataIsNotValidate];


}

