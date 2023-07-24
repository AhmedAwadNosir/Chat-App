import 'package:shared_preferences/shared_preferences.dart';

Future<String> getMyAvatar() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("avatar")!;
}
