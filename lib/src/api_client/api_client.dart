import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:registration_app/src/model/semua_provinsi.dart';
import 'dart:async';


class ApiClient{

  Client client = Client();

  final _baseurl = "http://dev.farizdotid.com/api/daerahindonesia/provinsi";

  Future<List<SemuaProvinsi>> fetchDataProvinsi() async{
    final response = await client.get(_baseurl);

    if(response.statusCode == 200){
      final responseprovJson = json.decode(response.body);
      List<SemuaProvinsi> semuaprovinsi = ApiResultModel.fromJson(responseprovJson).semuaprovinsi;
      return semuaprovinsi;
    } else{
      throw Exception('Failed fetch data');
    }

  }
}