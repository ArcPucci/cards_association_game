import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/screens/screens.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SinglePlayerScreen extends StatelessWidget {
  const SinglePlayerScreen({
    super.key,
    this.tourney = false,
    required this.path,
  });

  final bool tourney;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, StoreProvider>(
      builder:
          (BuildContext context, GameProvider value, value2, Widget? child) {
        return BackgroundWidget(
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: CustomIconButton(
                    icon: Images.backButton,
                    size: 56,
                    onTap: context.pop,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Image.asset(
                tourney ? Images.tourney : Images.single,
                width: 344.w,
                height: 128.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 516.h,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 4.h,
                      child: Container(
                        width: 344.w,
                        height: 512.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [AppColors.boxShadow2],
                        ),
                      ),
                    ),
                    Container(
                      width: 344.w,
                      height: 512.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          width: 4,
                          color: AppColors.blue1,
                        ),
                        gradient: AppColors.gradient1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Select Variation',
                            style: TextStyleHelpers.textStyle1,
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton1(
                                width: 144.w,
                                height: 68.h,
                                selected: value.level == levels[0],
                                text: 'QUICK',
                                onTap: () => value.selectComplexity(levels[0]),
                              ),
                              CustomButton1(
                                width: 144.w,
                                height: 68.h,
                                selected: value.level == levels[1],
                                text: 'CLASSIC',
                                onTap: () => value.selectComplexity(levels[1]),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          CustomButton1(
                            width: 304.w,
                            height: 68.h,
                            icon: Images.crown,
                            selected: value.level == levels[2],
                            text: 'MASTER',
                            onTap: () {
                              if (!value2.premium) {
                                onTapPremium(context);
                                return;
                              }
                              value.selectComplexity(levels[2]);
                            },
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Choose Gold',
                            style: TextStyleHelpers.textStyle1,
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(
                                icon: Images.decrease,
                                size: 48,
                                onTap: value.decreaseBet,
                              ),
                              FrameBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Win:',
                                          style: TextStyleHelpers.textStyle2,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          Images.coin,
                                          width: 20.r,
                                          height: 20.r,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          value.winGolds.toString(),
                                          style: TextStyleHelpers.textStyle2
                                              .copyWith(
                                            color: AppColors.yellow1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Entry:',
                                          style: TextStyleHelpers.textStyle2,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          Images.coin,
                                          width: 20.r,
                                          height: 20.r,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          value.loseGolds.toString(),
                                          style: TextStyleHelpers.textStyle2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CustomIconButton(
                                icon: Images.increase,
                                size: 48,
                                onTap: value.increaseBet,
                              ),
                            ],
                          ),
                          const Spacer(),
                          CustomButton2(
                            width: 224.w,
                            height: 64.h,
                            text: 'START',
                            onTap: () => value.onStartGame(path),
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
