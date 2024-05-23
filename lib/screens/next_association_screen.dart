import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextAssociationScreen extends StatelessWidget {
  const NextAssociationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, GameProvider value, Widget? child) {
        switch (value.answer) {
          case Answer.guessed:
            return YouGuessedDialog();
          case Answer.didNotGuessed:
            return YouDidNotGuessDialog();
          case Answer.timePassed:
            return TimeHasPassedDialog();
          case Answer.passedStage:
            return NextStageDialog();
        }
      },
    );
  }
}
