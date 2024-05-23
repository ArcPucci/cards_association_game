import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/widgets/dialogs/lose_dialog.dart';
import 'package:association_card_game/widgets/dialogs/single_win_dialog.dart';
import 'package:association_card_game/widgets/dialogs/tourney_win_dialog.dart';
import 'package:association_card_game/widgets/dialogs/two_game_finish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.gameMode == GameMode.multiple) return TwoGameFinish();
        switch (value.result) {
          case Result.win:
            switch (value.gameMode) {
              case GameMode.single:
                return SingleWinDialog();
              case GameMode.multiple:
                return TwoGameFinish();
              case GameMode.tourney:
                return TourneyWinDialog();
            }
          case Result.lose:
            return LoseDialog();
        }
      },
    );
  }
}
