


import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApiResultModel{

  bool error;
  String message;
  List<SemuaProvinsi> semuaprovinsi;

  ApiResultModel({this.error,this.message,this.semuaprovinsi});


  ApiResultModel.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];

    if(json['semuaprovinsi'] != null){
      semuaprovinsi = new List<SemuaProvinsi>();

      json['semuaprovinsi'].forEach((v){
        semuaprovinsi.add(new SemuaProvinsi.fromJson(v));
      });

    }
  }

}



class SemuaProvinsi extends Equatable{
  String nama;

  SemuaProvinsi({@required this.nama});

  @override
  List<Object> get props => [nama];

  @override
  String toString() {
    return 'SemuaProvinsi{ nama: $nama}';
  }


  SemuaProvinsi.fromJson(Map<String, dynamic> json){
    nama = json['nama'];

  }




}
