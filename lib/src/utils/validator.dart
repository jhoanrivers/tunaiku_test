

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

  static bool isNoRekeningMin8Angka(String input){
    if(input.length < 8){
      return false;
    } else return true;
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

  static String validateNoBlok(String value){

    if(value.isEmpty){
      return 'Required';
    }
    if (!value.contains(RegExp(r'[a-zA-Z0-9.-]')))
      return 'Masukkan Blok yang valid';

  }

  static String alamatValidate(String value){
    if(value.isEmpty){
      return 'Required';
    }
    if(value.length > 100){
      return "Alamat KTP tidak boleh lebih dari 100";
    }

  }

  static bool validateAlamatKtp(String input){
    if(input.isEmpty){
      return true;
    } else
      return false;
  }


  static String validateKtpNum(String value){

    if(value.isEmpty)
      return "Required";
    if (double.tryParse(value) == null)
      return "No KTP terdiri dari angka";
    if (value.length != 16)
      return "No KTP harus berjumlah 16 digit";

    return null;
  }

  static String validateCompleteName(String value){
    if(value.isEmpty)
      return "Required";
    if (value.contains(RegExp(r'[0-9]')))
      return "Nama hanya berupa huruf";
    if(value.length > 10)
      return "Maksimal kata adalah 10 huruf";

  }

  static String validateNoRekening (String input){
    if(input.isEmpty)
      return 'Required';
    if(!input.contains(RegExp(r'[0-9]')))
      return 'No rekening hanya berupa angka';

    if(input.length < 8)
      return 'No rekening minimal 8 angka';

  }


}