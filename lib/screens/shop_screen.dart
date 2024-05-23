import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BackgroundWidget(
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 28.w,
                ),
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: Images.backButton,
                      size: 56,
                      onTap: context.pop,
                    ),
                    const Spacer(),
                    Image.asset(
                      Images.coin,
                      width: 34.sp,
                      height: 34.sp,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      value.coins.toString(),
                      style: TextStyleHelpers.textStyle5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36.h),
              SizedBox(
                width: 356.w,
                height: 480.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 356.w,
                        height: 428.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Images.building),
                            fit: BoxFit.contain,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 48.w),
                        child: Column(
                          children: [
                            SizedBox(height: 120.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIconButton(
                                  icon: Images.prev,
                                  size: 48,
                                  onTap: () {
                                    if (currentIndex == 0) return;
                                    controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 172.h,
                                        child: PageView(
                                          controller: controller,
                                          onPageChanged: (index) {
                                            setState(() {
                                              currentIndex = index;
                                            });
                                          },
                                          children: List.generate(
                                            helpers.length,
                                            (index) {
                                              final helper = helpers[index];
                                              return Image.asset(
                                                helper.image,
                                                width: 160.w,
                                                height: 172.h,
                                                fit: BoxFit.contain,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      SizedBox(
                                        width: 112.w,
                                        height: 16.h,
                                        child: SmoothPageIndicator(
                                          controller: controller,
                                          count: 5,
                                          effect: ScaleEffect(
                                            scale: 1.25,
                                            dotHeight: 12.r,
                                            dotWidth: 12.r,
                                            dotColor: AppColors.blue6,
                                            activeDotColor: AppColors.blue7,
                                          ),
                                          onDotClicked: (index) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomIconButton(
                                  icon: Images.next,
                                  size: 48,
                                  onTap: () {
                                    if (currentIndex == 5) return;
                                    controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            CustomButton3(
                              text: helpers[currentIndex].price.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      Images.shop,
                      width: 204.w,
                      height: 84.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton2(
                text: 'BUY',
                enabled: value.coins >= helpers[currentIndex].price,
                onTap: () => value.buyHint(helpers[currentIndex]),
              ),
              SizedBox(height: 46.h),
            ],
          ),
        );
      },
    );
  }
}
