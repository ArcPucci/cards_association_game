import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = 'PREMIUM';
  static const linkKey = 'LINK_KEY';
  static const hint1Key = 'HINT1';
  static const hint2Key = 'HINT2';
  static const hint3Key = 'HINT3';
  static const hint4Key = 'HINT4';
  static const hint5Key = 'HINt5';
  static const coinsKey = 'COINS';

  Future<void> setCoins(int coins) async {
    await _preferences.setInt(coinsKey, coins);
  }

  int getCoins() {
    return _preferences.getInt(coinsKey) ?? 100;
  }

  Future<void> buyPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setLink(String link) async {
    await _preferences.setString(linkKey, link);
  }

  String? getLink() {
    return _preferences.getString(linkKey);
  }

  Future<void> setHint1(int count) async {
    await _preferences.setInt(hint1Key, count);
  }

  int getHint1() {
    return _preferences.getInt(hint1Key) ?? 1;
  }

  Future<void> setHint2(int count) async {
    await _preferences.setInt(hint2Key, count);
  }

  int getHint2() {
    return _preferences.getInt(hint2Key) ?? 1;
  }

  Future<void> setHint3(int count) async {
    await _preferences.setInt(hint3Key, count);
  }

  int getHint3() {
    return _preferences.getInt(hint3Key) ?? 1;
  }

  Future<void> setHint4(int count) async {
    await _preferences.setInt(hint4Key, count);
  }

  int getHint4() {
    return _preferences.getInt(hint4Key) ?? 1;
  }

  Future<void> setHint5(int count) async {
    await _preferences.setInt(hint5Key, count);
  }

  int getHint5() {
    return _preferences.getInt(hint5Key) ?? 1;
  }
}
