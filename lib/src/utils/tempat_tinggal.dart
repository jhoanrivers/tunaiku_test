

enum TempatTinggal {
  Rumah,
  Kantor
}



String enumToTempatTinggal(TempatTinggal tinggal){

  switch(tinggal){

    case TempatTinggal.Rumah:
      return "Rumah";
      break;
    case TempatTinggal.Kantor:
      return "Kantor";
      break;
  }
}