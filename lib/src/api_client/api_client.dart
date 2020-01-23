import 'package:http/http.dart' show Client;
import 'package:registration_app/src/model/provinsi.dart';
import 'dart:async';


class ApiProvider{

  Client client = Client();

  final _baseurl = "http://dev.farizdotid.com/api/daerahindonesia/provinsi";



  Future<List<Provinsi>> fetchDataProvinsi () async{
    final response = await client.get(_baseurl);

    if(response.statusCode == 200){
      final responseJson = 
    }

  }
}