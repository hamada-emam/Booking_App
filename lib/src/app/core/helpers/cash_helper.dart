import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key)  {
    return  sharedPreferences!.get(key);
  }

   static Future<bool> setData(String key,dynamic val)async  {
   if(val is bool) return await sharedPreferences!.setBool(key,val);
   if(val is double) return await sharedPreferences!.setDouble(key,val);
   if(val is String) {
     return await sharedPreferences!.setString(key,val);
   } else {
     return await sharedPreferences!.setInt(key,val);
   }
   
  }
}
