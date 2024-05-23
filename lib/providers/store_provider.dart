import 'package:association_card_game/models/helper.dart';
import 'package:association_card_game/services/preferences_service.dart';
import 'package:flutter/foundation.dart';

class StoreProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  StoreProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  int _hint1 = 0;

  int _hint2 = 0;

  int _hint3 = 0;

  int _hint4 = 0;

  int _hint5 = 0;

  int get hint1 => _hint1;

  int get hint2 => _hint2;

  int get hint3 => _hint3;

  int get hint4 => _hint4;

  int get hint5 => _hint5;

  bool _premium = false;

  bool get premium => _premium;

  int _coins = 0;

  int get coins => _coins;

  void init() {
    _hint1 = _preferencesService.getHint1();
    _hint2 = _preferencesService.getHint2();
    _hint3 = _preferencesService.getHint3();
    _hint4 = _preferencesService.getHint4();
    _hint5 = _preferencesService.getHint5();
    _coins = _preferencesService.getCoins();
    _premium = _preferencesService.getPremium();
  }

  void useHint1() async {
    if (hint1 <= 0) return;
    _hint1--;
    await _preferencesService.setHint1(_hint1);
    notifyListeners();
  }

  void useHint2() async {
    if (hint2 <= 0) return;
    _hint2--;
    await _preferencesService.setHint2(_hint2);
    notifyListeners();
  }

  void useHint3() async {
    if (hint3 <= 0) return;
    _hint3--;
    await _preferencesService.setHint1(_hint3);
    notifyListeners();
  }

  void useHint4() async {
    if (hint4 <= 0) return;
    _hint4--;
    await _preferencesService.setHint1(_hint4);
    notifyListeners();
  }

  void useHint5() async {
    if (hint5 <= 0) return;
    _hint5--;
    await _preferencesService.setHint1(_hint5);
    notifyListeners();
  }

  void buyPremium() async {
    _premium = true;
    _coins += 10000;
    await _preferencesService.setCoins(coins);
    await _preferencesService.buyPremium();
    notifyListeners();
  }

  void setCoins(int coins) async {
    _coins = coins;
    await _preferencesService.setCoins(coins);
  }

  void buyHint(Helper helper) async {
    if (_coins < helper.price) return;
    switch (helper.id) {
      case 0:
        _hint1++;
        _coins -= helper.price;
        await _preferencesService.setHint1(_hint1);
      case 1:
        _hint2++;
        _coins -= helper.price;
        await _preferencesService.setHint2(_hint2);
      case 2:
        _hint3++;
        _coins -= helper.price;
        await _preferencesService.setHint1(_hint3);
      case 3:
        _hint4++;
        _coins -= helper.price;
        await _preferencesService.setHint1(_hint4);
      case 4:
        _hint5++;
        _coins -= helper.price;
        await _preferencesService.setHint1(_hint5);
    }

    await _preferencesService.setCoins(_coins);
  }
}
