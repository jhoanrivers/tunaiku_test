

class Validator{

  static bool isNumber(String stringNum){
    if (stringNum == null) {
      return false;
    }
    return double.tryParse(stringNum) != null;
  }

  static bool isLength16(String number){
    if(number.length != 16){
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



}