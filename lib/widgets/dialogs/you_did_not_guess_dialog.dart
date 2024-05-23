import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class YouDidNotGuessDialog extends StatelessWidget {
  const YouDidNotGuessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Consumer<GameProvider>(
        builder: (BuildContext context, GameProvider value, Widget? child) {
          final currentIndex = value.currentCard;
          final total = 10;
          final card = value.card;
          final chosenCard = value.chosenCard;
          return Column(
            children: [
              SizedBox(height: 17.h),
              SizedBox(
                width: 344.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      onTap: value.onNext,
                      icon: Images.backButton,
                      size: 56,
                    ),
                    Text(
                      '$currentIndex/$total',
                      style: TextStyleHelpers.textStyle7,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              Image.asset(
                Images.youDidNotGuess,
                width: 333.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 15.h),
              BorderedText(text: card.name),
              SizedBox(height: 18.h),
              Text('RIGHT CARD', style: TextStyleHelpers.textStyle9),
              SizedBox(height: 15.h),
              Image.asset(
                card.image,
                width: 164.w,
                height: 164.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 18.h),
              Text('YOUR CARD', style: TextStyleHelpers.textStyle9),
              SizedBox(height: 15.h),
              Image.asset(
                chosenCard.image,
                width: 164.w,
                height: 164.h,
                fit: BoxFit.contain,
              ),
              Spacer(),
              CustomButton2(
                text: 'Next Association',
                width: 264.w,
                height: 64.h,
                onTap: value.onNext,
              ),
              SizedBox(height: 46.h),
            ],
          );
        },
      ),
    );
  }
}
