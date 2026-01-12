import 'package:flutter/material.dart';
import 'package:time_tracker/models/index.dart';
import 'package:time_tracker/constants/index.dart';
import 'package:time_tracker/services/index.dart';

class TaskService extends ChangeNotifier {
  final List<Task> _tasks = [];
  Task? _activeTask;
  TimerService? _activeTimer;

  List<Task> get tasks => List.unmodifiable(_tasks);
  Task? get activeTask => _activeTask;
  TimerService? get activeTimer => _activeTimer;

  TaskService() {
    _initializeTasks();
  }

  void _initializeTasks() {
    _tasks.clear();
    for (final taskName in Tasks.taskList) {
      _tasks.add(Task(name: taskName));
    }
    notifyListeners();
  }

  void startTracking(int index) {
    if (index < 0 || index >= _tasks.length) return;

    if (_activeTask != null && _activeTask!.isTracking) {
      stopTracking();
    }

    _activeTask = _tasks[index];
    _activeTimer = TimerService();
    _activeTimer!.addListener(_onTimerUpdate);

    _tasks[index] = _tasks[index].copyWith(isTracking: true);
    _activeTimer!.start();
    notifyListeners();
  }

  void pauseTracking() {
    if (_activeTimer == null || _activeTask == null) return;

    _activeTimer!.pause();
    final index = _tasks.indexWhere((t) => t.name == _activeTask!.name);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isPaused: true);
    }
    notifyListeners();
  }

  void resumeTracking() {
    if (_activeTimer == null || _activeTask == null) return;

    _activeTimer!.resume();
    final index = _tasks.indexWhere((t) => t.name == _activeTask!.name);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isPaused: false);
    }
    notifyListeners();
  }

  void stopTracking() {
    if (_activeTimer == null || _activeTask == null) return;

    final elapsedTime = _activeTimer!.elapsedTime;
    final index = _tasks.indexWhere((t) => t.name == _activeTask!.name);

    if (index != -1) {
      final currentTime = _tasks[index].trackedTime;
      _tasks[index] = _tasks[index].copyWith(
        trackedTime: currentTime + elapsedTime,
        isTracking: false,
        isPaused: false,
      );
    }

    _activeTimer!.removeListener(_onTimerUpdate);
    _activeTimer!.dispose();
    _activeTimer = null;
    _activeTask = null;
    notifyListeners();
  }

  void schedulePause(Duration duration) {
    if (_activeTimer == null) return;
    _activeTimer!.schedulePause(duration);
  }

  void _onTimerUpdate() {
    notifyListeners();
  }

  @override
  void dispose() {
    _activeTimer?.dispose();
    super.dispose();
  }
}
