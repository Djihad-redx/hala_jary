import 'package:shared_preferences/shared_preferences.dart';

  Future<String> getFromShared(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("$key") ?? "";
  }

  void setInShared(String key,String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("$key", value);
  }

