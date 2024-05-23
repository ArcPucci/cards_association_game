import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, GameProvider value, Widget? child) {
        final multiple = value.gameMode == GameMode.multiple;
        final odd = value.currentCard % 2 != 0;
        final tourney = value.gameMode == GameMode.tourney;
        final title = multiple
            ? odd
                ? value.player1
                : value.player2
            : tourney
                ? 'round ${value.currentCard}'
                : '';
        final total = value.level.commonCards;
        return BackgroundWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              children: [
                SizedBox(height: 17.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      icon: Images.backButton,
                      size: 56,
                      onTap: context.pop,
                    ),
                    SizedBox(
                      height: 56.sp,
                      child: Text(
                        '${value.counter}s',
                        style: TextStyleHelpers.textStyle6,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${value.currentCard}/$total',
                          style: TextStyleHelpers.textStyle7,
                        ),
                        Text(
                          title,
                          style: TextStyleHelpers.textStyle11,
                        ),
                      ],
                    ),
                  ],
                ),
                BorderedText(text: value.card.name),
                SizedBox(height: 16.h),
                HintsRibbon(
                  onMix: value.onMix,
                  onAddTime: value.onAddTime,
                  removeCard: value.removeCard,
                  onSwap: value.onSwap,
                  onSkip: value.onSkip,
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: GridView.builder(
                    itemCount: value.cards.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 16.r,
                      mainAxisSpacing: 16.r,
                      mainAxisExtent: 164.r,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final card = value.cards[index];
                      final removed = value.deletedCards.contains(card.id);
                      return removed
                          ? SizedBox()
                          : GestureDetector(
                              onTap: () => value.onAnswer(card),
                              child: Image.asset(card.image),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
