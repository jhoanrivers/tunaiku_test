


import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable{
  final List mProps;
  RegisterEvent([this.mProps = const[]]);

  @override
  List<Object> get props => this.mProps;
}


class KtpNumberChanged extends RegisterEvent{

  final String ktpNumber;

  KtpNumberChanged({@required this.ktpNumber}) : super([ktpNumber]);

}


class Submitted extends RegisterEvent{

  final String ktpNumber;

  Submitted({@required this.ktpNumber}) : super([ktpNumber]);

}
