enum TaskPriority {
  high,
  medium,
  low;

  String get key => switch (this) {
    high => 'high',
    medium => 'medium',
    low => 'low',
  };
}
