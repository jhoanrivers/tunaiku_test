

import 'package:registration_app/src/api_client/api_client.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';

class Repository {

  ApiClient apiClient = ApiClient();

  Future<List<SemuaProvinsi>> getDataProvinsi ()  => apiClient.fetchDataProvinsi();


}