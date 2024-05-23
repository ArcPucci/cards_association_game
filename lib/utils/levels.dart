import 'package:association_card_game/models/models.dart';

final List<Level> levels = [
  Level(
    id: 0,
    name: 'Quick',
    premium: false,
    duration: 12,
    commonCards: 10,
  ),
  Level(
    id: 1,
    name: 'Classic',
    premium: false,
    duration: 15,
    commonCards: 15,
  ),
  Level(
    id: 2,
    name: 'Master',
    premium: true,
    duration: 8,
    commonCards: 20,
  ),
  Level(
    id: 3,
    name: 'Multiple',
    premium: false,
    duration: 15,
    commonCards: 20,
  ),
];
