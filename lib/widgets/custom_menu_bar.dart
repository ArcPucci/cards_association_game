import 'package:association_card_game/main.dart';
import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/screens/screens.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomMenuBar extends StatefulWidget {
  const CustomMenuBar({super.key});

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  bool menuOpened = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          width: 342.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: menuOpened,
                child: Row(
                  children: [
                    if (!value.premium) ...[
                      CustomIconButton(
                        icon: Images.smallPremium,
                        size: 48,
                        onTap: () => onTapPremium(context),
                      ),
                      SizedBox(width: 8.w),
                    ],
                    CustomIconButton(
                      icon: Images.smallSupport,
                      size: 48,
                      onTap: () => launchUri(Links.support),
                    ),
                    SizedBox(width: 8.w),
                    CustomIconButton(
                      icon: Images.smallTerms,
                      size: 48,
                      onTap: () => launchUri(Links.termsOfUse),
                    ),
                    SizedBox(width: 8.w),
                    CustomIconButton(
                      icon: Images.smallSecurity,
                      size: 48,
                      onTap: () => launchUri(Links.privacyPolicy),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
              CustomIconButton(
                size: 56,
                onTap: () => setState(() => menuOpened = !menuOpened),
                icon: menuOpened ? Images.arrowRight : Images.menuButton,
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
