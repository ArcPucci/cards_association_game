import 'package:association_card_game/main.dart';
import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool purchaseLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Material(
            child: Container(
              width: 390.w,
              height: 844.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.paywall),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 17.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Images.premium,
                          width: 202.w,
                          height: 56.h,
                          fit: BoxFit.contain,
                        ),
                        CustomIconButton(
                          icon: Images.close,
                          size: 56,
                          onTap: context.pop,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton2(
                      text: 'BUY PREMIUM \$0,99',
                      width: 296.w,
                      height: 68.h,
                      onTap: _onBuyPremium,
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: 296.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            icon: Images.smallTerms,
                            size: 48,
                            onTap: () => launchUri(Links.termsOfUse),
                          ),
                          BigButton(
                            asset: Images.restore,
                            width: 174.w,
                            height: 48.h,
                            onTap: _onBuyPremium,
                          ),
                          CustomIconButton(
                            icon: Images.smallSecurity,
                            size: 48,
                            onTap: () => launchUri(Links.privacyPolicy),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: purchaseLoading,
            child: Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onBuyPremium() async {
    final provider = Provider.of<StoreProvider>(context, listen: false);
    provider.buyPremium();
    context.pop();
  }
}
