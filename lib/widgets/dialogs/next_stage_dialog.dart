import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NextStageDialog extends StatelessWidget {
  const NextStageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Consumer<GameProvider>(
        builder: (BuildContext context, GameProvider value, Widget? child) {
          final digit = digits[value.currentCard - 1];
          return Column(
            children: [
              Container(
                width: 472.r,
                height: 472.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.youHavePassed),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  bottom: 20.h,
                  top: 19.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 26.w),
                        child: CustomIconButton(
                          icon: Images.backButton,
                          size: 56,
                          onTap: value.onNext,
                        ),
                      ),
                    ),
                    Text(
                      "YOU'VE PASSED STAGE $digit",
                      style: TextStyleHelpers.textStyle8,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              CustomButton2(
                text: 'Next Round',
                width: 264.w,
                height: 64.h,
                onTap: value.onNext,
              ),
            ],
          );
        },
      ),
    );
  }
}
