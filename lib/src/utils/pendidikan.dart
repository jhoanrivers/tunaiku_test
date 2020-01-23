
enum Pendidikan {
  SD,
  SMP,
  SMA,
  S1,
  S2,
  S3
}

String enumToPendidikan(Pendidikan pendidikan){
  switch(pendidikan){

    case Pendidikan.SD:
      return "SD";
      break;
    case Pendidikan.SMP:
      return "SMP";
      break;
    case Pendidikan.SMA:
      return "SMA";
      break;
    case Pendidikan.S1:
      return "S1";
      break;
    case Pendidikan.S2:
      return "S2";
      break;
    case Pendidikan.S3:
      return "S3";
      break;
  }
}