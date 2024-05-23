class Level {
  final int id;
  final String name;
  final bool premium;
  final int duration;
  final int commonCards;

  const Level({
    required this.id,
    required this.name,
    required this.premium,
    required this.duration,
    required this.commonCards,
  });
}