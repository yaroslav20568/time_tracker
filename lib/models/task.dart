class Task {
  final String name;
  final Duration trackedTime;
  final bool isTracking;
  final bool isPaused;

  const Task({
    required this.name,
    this.trackedTime = Duration.zero,
    this.isTracking = false,
    this.isPaused = false,
  });

  Task copyWith({
    String? name,
    Duration? trackedTime,
    bool? isTracking,
    bool? isPaused,
  }) {
    return Task(
      name: name ?? this.name,
      trackedTime: trackedTime ?? this.trackedTime,
      isTracking: isTracking ?? this.isTracking,
      isPaused: isPaused ?? this.isPaused,
    );
  }
}
