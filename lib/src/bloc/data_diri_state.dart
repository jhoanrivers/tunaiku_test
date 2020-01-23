import 'package:equatable/equatable.dart';

abstract class DataDiriState extends Equatable {
  final List mProps;
  DataDiriState([this.mProps = const []]);

  @override
  List<Object> get props => this.mProps;
}

class DataDiriInitial extends DataDiriState{}

class DataDiriLoading extends DataDiriState{}

class DataDiriSuccess extends DataDiriState{

  final bool isValidate;

  DataDiriSuccess({this.isValidate});

  @override
  List<Object> get props =>[isValidate];


}

class DataDiriError extends DataDiriState{

}

