import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/images.dart';
import 'package:association_card_game/utils/text_style_helpers.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class YouGuessedDialog extends StatelessWidget {
  const YouGuessedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Consumer<GameProvider>(
        builder: (BuildContext context, GameProvider value, Widget? child) {
          final currentIndex = value.currentCard;
          final total = value.level.commonCards;
          final card = value.card;
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
              Container(
                width: 390.w,
                height: 340.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.ray),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Images.youGuessed,
                      width: 295.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20.h),
                    BorderedText(text: card.name),
                    Spacer(),
                    Image.asset(
                      card.image,
                      width: 164.w,
                      height: 164.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
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
