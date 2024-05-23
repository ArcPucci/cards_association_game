import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TourneyWinDialog extends StatelessWidget {
  const TourneyWinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BackgroundWidget(
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Container(
                width: 356.w,
                height: 578.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.tourneyWin),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FrameBox(
                      hasPadding: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WIN", style: TextStyleHelpers.textStyle10),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Images.coin,
                                width: 20.r,
                                height: 20.r,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '10 000',
                                style: TextStyleHelpers.textStyle2.copyWith(
                                  color: AppColors.yellow1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 210.w,
                      child: Text(
                        'YOU MADE IT THROUGH THE TOURNAMENT',
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
