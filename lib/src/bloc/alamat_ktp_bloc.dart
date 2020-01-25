
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/src/api_client/repository.dart';
import 'package:registration_app/src/bloc/alamat_ktp_event.dart';
import 'package:registration_app/src/bloc/alamat_ktp_state.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';
import 'package:registration_app/src/utils/validator.dart';

class AlamatKtpBloc extends Bloc<AlamatKtpEvent,AlamatKtpState>{

  final Repository repository;

  AlamatKtpBloc({this.repository});

  @override
  AlamatKtpState get initialState => AlamatKtpInitialState();


  @override
  Stream<AlamatKtpState> mapEventToState(AlamatKtpEvent event) async*{

    if(event is FetchProvinsi){
      yield AlamatKtpLoadingState();
      try{
        List<SemuaProvinsi> response = await repository.getDataProvinsi();
        yield AlamatKtpSuccessState(provs: response);

      } catch(_){
        yield AlamatKtpErrorState();
      }
    }

    if (event is SubmittedAlamat){
      yield AlamatKtpLoadingState();
      try{
        if(Validator.isNotNull(event.alamatKtp))
          print('HAHA');

      }catch(_){
        yield AlamatKtpErrorState();
      }


    }

  }

}