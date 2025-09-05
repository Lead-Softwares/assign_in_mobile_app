enum TaskPriority {
  high,
  medium,
  low;

  String get key => switch (this) {
    high => 'high',
    medium => 'medium',
    low => 'low',
  };
  int get order => switch (this) {
    high => 0,
    medium => 1,
    low => 2,
  };
}
