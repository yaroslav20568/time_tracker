import 'package:flutter/material.dart';
import 'package:time_tracker/models/index.dart';
import 'package:time_tracker/constants/index.dart';
import 'package:time_tracker/services/index.dart';

class TaskService extends ChangeNotifier {
  final List<Task> _tasks = [];
  Task? _activeTask;
  TimerService? _activeTimer;
  final StorageService _storageService = StorageService();

  List<Task> get tasks => List.unmodifiable(_tasks);
  Task? get activeTask => _activeTask;
  TimerService? get activeTimer => _activeTimer;

  TaskService() {
    _initializeTasks();
    _loadCachedTasks();
  }

  void _initializeTasks() {
    _tasks.clear();
    for (final taskName in Tasks.taskList) {
      _tasks.add(Task(name: taskName));
    }
    notifyListeners();
  }

  Future<void> _loadCachedTasks() async {
    final cachedTasks = await _storageService.loadTasks();
    final cachedTasksMap = {for (var task in cachedTasks) task.name: task};

    for (var i = 0; i < _tasks.length; i++) {
      final taskName = _tasks[i].name;
      if (cachedTasksMap.containsKey(taskName)) {
        _tasks[i] = cachedTasksMap[taskName]!;
      }
    }
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    await _storageService.saveTasks(_tasks);
  }

  void startTracking(int index) {
    if (index < 0 || index >= _tasks.length) return;

    if (_activeTask != null && _activeTask!.isTracking) {
      stopTracking();
    }

    for (var i = 0; i < _tasks.length; i++) {
      if (i == index) {
        _tasks[i] = _tasks[i].copyWith(isTracking: true, isPaused: false);
      } else {
        _tasks[i] = _tasks[i].copyWith(isTracking: false, isPaused: false);
      }
    }

    _activeTask = _tasks[index];
    _activeTimer = TimerService();
    _activeTimer!.addListener(_onTimerUpdate);

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
      _saveTasks();
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
