import 'package:association_card_game/utils/helpers.dart';
import 'package:association_card_game/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HintsRibbon extends StatelessWidget {
  const HintsRibbon({
    super.key,
    this.onMix,
    this.onAddTime,
    this.removeCard,
    this.onSwap,
    this.onSkip,
  });

  final VoidCallback? onMix;
  final VoidCallback? onAddTime;
  final VoidCallback? removeCard;
  final VoidCallback? onSwap;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: helpers[0].icon,
          size: 56,
          onTap: onMix,
        ),
        CustomIconButton(
          icon: helpers[1].icon,
          size: 56,
          onTap: onAddTime,
        ),
        CustomIconButton(
          icon: helpers[2].icon,
          size: 56,
          onTap: removeCard,
        ),
        CustomIconButton(
          icon: helpers[3].icon,
          size: 56,
          onTap: onSwap,
        ),
        CustomIconButton(
          icon: helpers[4].icon,
          size: 56,
          onTap: onSkip,
        ),
      ],
    );
  }
}
