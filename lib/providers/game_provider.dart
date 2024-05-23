import 'dart:async';
import 'dart:math';

import 'package:association_card_game/models/models.dart';
import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum GameMode { single, multiple, tourney }

enum Answer { guessed, didNotGuessed, timePassed, passedStage }

enum Result { win, lose }

class GameProvider extends ChangeNotifier {
  final StoreProvider _storeProvider;
  final GoRouter _router;

  GameProvider({
    required GoRouter router,
    required StoreProvider storeProvider,
  })  : _router = router,
        _storeProvider = storeProvider;

  GameMode _gameMode = GameMode.single;

  Level _level = levels[0];

  Level get level => _level;

  GameCard _chosenCard = GameCard(id: -1, name: '', image: '');

  GameCard get chosenCard => _chosenCard;

  int _winGolds = 10000;

  int _loseGolds = 5000;

  int get winGolds => _winGolds;

  int get loseGolds => _loseGolds;

  String _player1 = '';

  String _player2 = '';

  String get player1 => _player1;

  String get player2 => _player2;

  int _first = 0;

  int _second = 0;

  int get first => _first;

  int get second => _second;

  List<GameCard> _gameCards = [];

  List<GameCard> get cards => _gameCards;

  GameCard _card = GameCard(id: -1, name: '', image: '');

  GameCard get card => _card;

  Timer? _timer;

  int _counter = 15;

  int get counter => _counter;

  int _total = 0;

  int get total => _total;

  int _currentCard = 1;

  int get currentCard => _currentCard;

  List<GameCard> _allCards = [];

  Answer _answer = Answer.guessed;

  Answer get answer => _answer;

  Result _result = Result.win;

  Result get result => _result;

  GameMode get gameMode => _gameMode;

  List<int> _deletedCards = [];

  List<int> get deletedCards => _deletedCards;

  void selectGameMode(GameMode gameMode) {
    _gameMode = gameMode;
    _level = levels[0];
    switch (gameMode) {
      case GameMode.single:
        _router.go('/single_game');
      case GameMode.multiple:
        _level = levels.last;
        _router.go('/two_game');
      case GameMode.tourney:
        _router.go('/tourney_game');
    }
  }

  void selectComplexity(Level level) {
    _level = level;
    notifyListeners();
  }

  void increaseBet() {
    if (_winGolds >= 15000) return;
    _winGolds += 500;
    _loseGolds += 500;
    notifyListeners();
  }

  void decreaseBet() {
    if (_loseGolds <= 2500) return;
    _winGolds -= 500;
    _loseGolds -= 500;
    notifyListeners();
  }

  void setPlayersNames(String p1, String p2, String path) {
    _player1 = p1;
    _player2 = p2;
    onStartGame(path);
  }

  void onStartGame(String path) {
    _router.go("$path/game_screen");
    int coins = _storeProvider.coins - loseGolds;
    if (coins < 0) coins = 0;
    _storeProvider.setCoins(coins);
    _counter = _level.duration;
    _total = 0;
    _currentCard = 1;
    _first = 0;
    _second = 0;
    _allCards = [...gameCards, ...otherCards];

    _generateCards();
    _startTimer();
  }

  void onRestart() {
    String path = _router.routerDelegate.currentConfiguration.fullPath;
    while (path.split('/').last != 'game_screen') {
      if (!_router.canPop()) break;
      _router.pop();
      path = _router.routerDelegate.currentConfiguration.fullPath;
    }
    _counter = _level.duration;
    _total = 0;
    _currentCard = 1;
    _first = 0;
    _second = 0;
    _allCards = [...gameCards, ...otherCards];

    _generateCards();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final path = _router.routerDelegate.currentConfiguration.fullPath;
      if (!path.contains('/game_screen')) _timer?.cancel();
      if (_counter <= 0) {
        _onTimePassed();
        return;
      }
      _counter--;
      print('timer');
      notifyListeners();
    });
  }

  void _onTimePassed() {
    _timer?.cancel();
    _answer = Answer.timePassed;
    final path = _router.routerDelegate.currentConfiguration.fullPath;
    _router.go('$path/next_association_screen');
  }

  void _generateCards() {
    _deletedCards.clear();
    int rand = Random().nextInt(_allCards.length);
    _card = _allCards[rand];
    while (_card.name.isEmpty) {
      rand = Random().nextInt(_allCards.length);
      _card = _allCards[rand];
    }
    _allCards.removeWhere((element) => element.name == _card.name);
    final temp = List<GameCard>.from(_allCards);
    temp.shuffle();
    _gameCards = temp.take(5).toList();
    _gameCards.add(_card);
    _gameCards.shuffle();
  }

  void onAnswer(GameCard card) {
    _chosenCard = card;
    if (card.name == _card.name) {
      _total++;
      if ((_total + 1) % 2 != 0) {
        _first++;
      } else {
        _second++;
      }
      if (_gameMode == GameMode.tourney) {
        _answer = Answer.passedStage;
      } else {
        _answer = Answer.guessed;
      }
    } else {
      _answer = Answer.didNotGuessed;
    }
    _timer?.cancel();
    final path = _router.routerDelegate.currentConfiguration.fullPath;
    _router.go('$path/next_association_screen');
  }

  void onNext() {
    _router.pop();
    if (_currentCard == _level.commonCards) {
      onFinish();
      return;
    }
    _currentCard++;
    _generateCards();
    _counter = _level.duration;
    _startTimer();
  }

  void onMix() {
    final hint = _storeProvider.hint1;
    if (hint <= 0) return;
    _storeProvider.useHint1();
    _gameCards.shuffle();
    notifyListeners();
  }

  void onAddTime() {
    final hint = _storeProvider.hint2;
    if (hint <= 0) return;
    _storeProvider.useHint2();
    _counter += 10;
    notifyListeners();
  }

  void removeCard() {
    final hint = _storeProvider.hint3;
    if (hint <= 0) return;
    _storeProvider.useHint3();
    if (_deletedCards.length >= 5) return;
    int rand = Random().nextInt(5);
    while (_gameCards[rand].id == _card.id ||
        _deletedCards.contains(_gameCards[rand].id)) {
      rand = Random().nextInt(6);
    }
    _deletedCards.add(_gameCards[rand].id);
    print('deleted $_deletedCards');
    notifyListeners();
  }

  void onSwap() {
    final hint = _storeProvider.hint4;
    if (hint <= 0) return;
    _storeProvider.useHint4();
    final list = List<GameCard>.from(_allCards);
    _generateCards();
    _allCards = list;
    notifyListeners();
  }

  void onSkip() {
    final hint = _storeProvider.hint5;
    if (hint <= 0) return;
    _storeProvider.useHint5();
    onAnswer(_card);
  }

  void onFinish() {
    _timer?.cancel();
    _result = _total == _level.commonCards ? Result.win : Result.lose;
    if (_result == Result.win) {
      final coins = _storeProvider.coins + winGolds;
      _storeProvider.setCoins(coins);
    }
    final path = _router.routerDelegate.currentConfiguration.fullPath;
    _router.go('$path/result_screen');
  }

  void goHome() {
    _router.go('/');
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
