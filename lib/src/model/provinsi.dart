


class ProvinsiResponse{
  final String error;
  final String message;
  List<Provinsi> semuaprovinsi;

  ProvinsiResponse({this.error, this.message, this.semuaprovinsi});

}


class Provinsi{
  final String id;
  final String nama;

  Provinsi({this.id, this.nama});
}