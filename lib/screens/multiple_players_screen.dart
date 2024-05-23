import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/utils/utils.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MultiplePlayersScreen extends StatefulWidget {
  const MultiplePlayersScreen({
    super.key,
    required this.path,
  });

  final String path;

  @override
  State<MultiplePlayersScreen> createState() => _MultiplePlayersScreenState();
}

class _MultiplePlayersScreenState extends State<MultiplePlayersScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller1.addListener(() => setState(() {}));
    controller2.addListener(() => setState(() {}));
  }

  bool get canStart =>
      controller1.text.isNotEmpty && controller2.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
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
                Images.twoPlayers,
                width: 344.w,
                height: 372.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 310.w,
                child: Text('Player 1', style: TextStyleHelpers.textStyle4),
              ),
              SizedBox(height: 8.h),
              CustomInput(controller: controller1),
              SizedBox(height: 16.h),
              SizedBox(
                width: 310.w,
                child: Text('Player 2', style: TextStyleHelpers.textStyle4),
              ),
              SizedBox(height: 8.h),
              CustomInput(controller: controller2),
              const Spacer(),
              CustomButton2(
                text: 'START',
                enabled: canStart,
                onTap: () => value.setPlayersNames(
                  controller1.text,
                  controller2.text,
                  widget.path,
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        );
      },
    );
  }
}
