

import 'package:registration_app/src/api_client/api_client.dart';
import 'package:registration_app/src/model/provinsi_response.dart';

class Repository {

  ApiClient apiClient = ApiClient();

  Future<ProvinsiResponse> getDataProvinsi () => apiClient.fetchDataProvinsi();


}