

class Validator{

  static bool isNumber(String stringNum){
    if (stringNum == null) {
      return false;
    }
    return double.tryParse(stringNum) != null;
  }

  static bool isLength16(String ktpNumber){
    if(ktpNumber.length != 16){
      return false;
    }  else{
      return true;
    }
  }

  static bool isNotNull(String input){
    if(input.isNotEmpty){
      return true;
    } else{
      return false;
    }
  }

  static bool isLength10(String input){
    if(input.length <= 10){
      return true;
    } else{
      return false;
    }
  }

  static bool isTanggalValid(String tanggal){
    if(tanggal == "-/ -/ -"){
      return false;
    } else{
      return true;
    }
  }

  static bool isKtpNumberAllValid(String ktpNumber){
    if(isNumber(ktpNumber) && isLength16(ktpNumber) && isNotNull(ktpNumber)){
      return true;
    } else{
      return false;
    }
  }

  static bool isNamaLengkapAllValid(String namaLengkap){
    if(isNotNull(namaLengkap) && isLength10(namaLengkap)){
      return true;
    } else {
      return false;
    }
  }



}