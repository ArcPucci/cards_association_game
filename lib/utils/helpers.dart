import 'package:association_card_game/models/models.dart';
import 'package:association_card_game/utils/images.dart';

const buttons = 'assets/png/buttons';

final List<Helper> helpers = [
  Helper(
    id: 0,
    icon: "$buttons/mix.png",
    image: Images.bonus1,
    price: 500,
  ),
  Helper(
    id: 1,
    icon: "$buttons/extra_time.png",
    image: Images.bonus2,
    price: 1000,
  ),
  Helper(
    id: 2,
    icon: "$buttons/bucket.png",
    image: Images.bonus3,
    price: 1000,
  ),
  Helper(
    id: 3,
    icon: "$buttons/swap_cards.png",
    image: Images.bonus4,
    price: 1500,
  ),
  Helper(
    id: 4,
    icon: "$buttons/skip.png",
    image: Images.bonus5,
    price: 2000,
  ),
];
