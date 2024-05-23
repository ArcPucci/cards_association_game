import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TwoGameFinish extends StatelessWidget {
  const TwoGameFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final p1 = value.player1;
        final p2 = value.player2;
        final first = value.first;
        final second = value.second;
        final commonCards = value.level.commonCards ~/ 2;
        return BackgroundWidget(
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Container(
                width: 356.w,
                height: 578.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.twoGameFinish),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 267.w,
                      child: Text(
                        '$p1 GUESSED $first/$commonCards ASSOCIATIONS.',
                        style: TextStyleHelpers.textStyle9.copyWith(
                          color: AppColors.blue4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 45.h),
                    SizedBox(
                      width: 267.w,
                      child: Text(
                        '$p2 GUESSED $second/$commonCards ASSOCIATIONS.',
                        style: TextStyleHelpers.textStyle9.copyWith(
                          color: AppColors.blue4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton2(
                      text: 'Repeat',
                      height: 52.h,
                      onTap: value.onRestart,
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
              ),
              Spacer(),
              CustomButton1(
                text: 'Home',
                borderRadius: 24,
                width: 264.w,
                height: 64.h,
                onTap: value.goHome,
              ),
              SizedBox(height: 46.h),
            ],
          ),
        );
      },
    );
  }
}
