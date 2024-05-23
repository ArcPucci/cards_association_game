import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return BackgroundWidget(
      child: Column(
        children: [
          SizedBox(height: 17.h),
          const CustomMenuBar(),
          SizedBox(height: 4.h),
          Image.asset(
            Images.logo,
            width: 344.w,
            height: 128.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 360.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigButton(
                  width: 174.w,
                  asset: Images.singlePlayer,
                  onTap: () => provider.selectGameMode(GameMode.single),
                ),
                BigButton(
                  width: 174.w,
                  asset: Images.twoPlayersButton,
                  onTap: () => provider.selectGameMode(GameMode.multiple),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          BigButton(
            asset: Images.tourneyButton,
            onTap: () => provider.selectGameMode(GameMode.tourney),
          ),
          SizedBox(height: 16.h),
          BigButton(
            asset: Images.shopButton,
            onTap: () => context.go('/shop_screen'),
          ),
        ],
      ),
    );
  }
}
