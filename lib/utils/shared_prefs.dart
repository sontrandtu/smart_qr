import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //TODO: Example
  set firstOpen(bool isFirst) {
    _prefs.setBool('Constants.kFirstOpen', isFirst);
  }
}
