import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:registration_app/src/model/provinsi_response.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';
import 'dart:async';


class ApiClient{

  Client client = Client();

  final _baseurl = "http://dev.farizdotid.com/api/daerahindonesia/provinsi";

  Future<ProvinsiResponse> fetchDataProvinsi () async{
    final response = await client.get(_baseurl);

    if(response.statusCode == 200){
      print('success');
      return ProvinsiResponse.fromJson(json.decode(response.body));
    } else{
      throw Exception('Failed fetch data');
    }

  }
}