import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TimeHasPassedDialog extends StatelessWidget {
  const TimeHasPassedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final card = value.card;
        return BackgroundWidget(
          child: Column(
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
                    Text('${value.currentCard}/10',
                        style: TextStyleHelpers.textStyle7),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              Image.asset(
                Images.timeHasPassed,
                width: 321.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
              BorderedText(text: card.name),
              SizedBox(height: 24.h),
              Text('RIGHT CARD', style: TextStyleHelpers.textStyle9),
              SizedBox(height: 20.h),
              Image.asset(
                card.image,
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
          ),
        );
      },
    );
  }
}
