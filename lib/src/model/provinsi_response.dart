import 'semua_provinsi.dart';

class ProvinsiResponse {
  String error;
  String message;
  List<SemuaProvinsi> semuaprovinsi;


  ProvinsiResponse.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];
    List<SemuaProvinsi> semuaprovinsi = [];
    for(int i= 0; i < json['semuaprovinsi'].length ; i++){
      SemuaProvinsi semuaProvinsi = SemuaProvinsi(json['semuaprovinsi'][i]);
      semuaprovinsi.add(semuaProvinsi);
    }
  }

}