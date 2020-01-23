
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:registration_app/src/bloc/register_event.dart';
import 'package:registration_app/src/bloc/register_state.dart';
import 'package:registration_app/src/utils/data_saved.dart';
import 'package:registration_app/src/utils/validator.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  @override

  RegisterState get initialState => DataDiriInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is Submitted) {
      yield DataDiriLoading();

      try {

        if (!Validator.isNotNull(event.ktpNumber)) {
          yield DataDiriError(dataIsNotValidate: "No KTP tidak boleh kosong");
        }
        if (!Validator.isNumber(event.ktpNumber)) {
          yield DataDiriError(dataIsNotValidate: "No KTP terdiri dari angka");
        }
        if (!Validator.isLength16(event.ktpNumber)) {
          yield DataDiriError(
              dataIsNotValidate: "No KTP harus berjumlah 16 digit");
        } else {
          yield DataDiriSuccess(isValidate: true);
        }
      } catch (_) {
        throw Exception("Data gagal diolah");
      }
    }
  }

}