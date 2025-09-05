enum TaskStatus {
  todo,
  progress,
  completed;

  String get key => switch (this) {
    todo => 'todo',
    progress => 'progress',
    completed => 'completed',
  };
}
