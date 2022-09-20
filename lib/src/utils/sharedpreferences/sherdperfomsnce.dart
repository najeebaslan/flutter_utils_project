/*File : FuSharedPreferences
Version : 1.2.0
*/

///[FuSharedPreferences]  There are mainly 8 types of FuSharedPreferences, [getString,setString,setInt,getInt,setBool,getBool,deleteString,clereAllData]

import 'package:shared_preferences/shared_preferences.dart';

class FuSharedPreferences {
  //this is for get string from Preferences
  static getString(
    String key,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.getString(key);
    return result;
  }

  //this is for set string from Preferences
  static setString(String key, value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.setString(key, value);
    return result;
  }

  //this is for set int from Preferences
  static setInt(String key, value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.setInt(key, value);
    return result;
  }

  //this is for get int from Preferences
  static getInt(
    String key,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.getInt(
      key,
    );
    return result;
  }

  //this is for set bool from Preferences
  static setBool(String key, value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.setBool(key, value);
    return result;
  }

  //this is for get bool from Preferences
  static getBool(
    String key,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.getBool(key);
    return result;
  }

  //this is for get string from Preferences
  static deleteString(
    String key,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.remove(key);
    return result;
  }

  //this is for get string from Preferences
  static clear(
    String key,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    var result = preference.clear();
    return result;
  }
}
