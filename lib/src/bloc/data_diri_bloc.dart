
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:registration_app/src/bloc/data_diri_event.dart';
import 'package:registration_app/src/bloc/data_diri_state.dart';
import 'package:registration_app/src/model/data_saved.dart';
import 'package:registration_app/src/utils/validator.dart';

class DataDiriBloc extends Bloc<DataDiriEvent, DataDiriState>{
  @override

  DataSaved dataSaved = new DataSaved();
  DataDiriState get initialState => DataDiriInitial();

  @override
  Stream<DataDiriState> mapEventToState(DataDiriEvent event) async* {
    if (event is Submitted) {
      yield DataDiriLoading();
      try {
        if(Validator.isKtpNumberAllValid(event.ktpNumber)
            && Validator.isNamaLengkapAllValid(event.namaLengkap)
            && Validator.isTanggalValid(event.tanggalLahir)
            && Validator.isNoRekeningMin8Angka(event.noRekening)){

          dataSaved.ktpNumber = event.ktpNumber;
          dataSaved.namaLengkap = event.namaLengkap;
          dataSaved.noRekening = event.noRekening;
          dataSaved.pendidikan = event.pendidikan;
          dataSaved.tanggalLahir = event.tanggalLahir;

          print(dataSaved.toString());
          yield DataDiriSuccess(isValidate: true);
        }
      } catch (_) {
        yield DataDiriError();
      }
    }
  }

}