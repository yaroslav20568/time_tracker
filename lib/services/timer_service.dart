import 'dart:async';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  DateTime? _startTime;
  DateTime? _pauseTime;
  Duration? _scheduledPauseDuration;
  bool _isRunning = false;
  bool _isPaused = false;

  Duration get elapsedTime => _elapsedTime;
  bool get isRunning => _isRunning;
  bool get isPaused => _isPaused;

  void start() {
    if (_isRunning) return;

    _isRunning = true;
    _isPaused = false;
    _startTime = DateTime.now();

    if (_pauseTime != null) {
      final pauseDuration = DateTime.now().difference(_pauseTime!);
      _startTime = _startTime!.add(pauseDuration);
      _pauseTime = null;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startTime != null) {
        _elapsedTime = DateTime.now().difference(_startTime!);
        notifyListeners();
      }
    });

    notifyListeners();
  }

  void pause() {
    if (!_isRunning) return;

    _timer?.cancel();
    _isRunning = false;
    _isPaused = true;
    _pauseTime = DateTime.now();
    notifyListeners();
  }

  void resume() {
    if (!_isPaused) return;

    if (_pauseTime != null) {
      final pauseDuration = DateTime.now().difference(_pauseTime!);
      if (_startTime != null) {
        _startTime = _startTime!.add(pauseDuration);
      }
      _pauseTime = null;
    }

    _isRunning = true;
    _isPaused = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startTime != null) {
        _elapsedTime = DateTime.now().difference(_startTime!);
        notifyListeners();
      }
    });

    notifyListeners();
  }

  void schedulePause(Duration duration) {
    _scheduledPauseDuration = duration;
    Future.delayed(duration, () {
      if (_isRunning && _scheduledPauseDuration == duration) {
        pause();
        _scheduledPauseDuration = null;
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _isPaused = false;
    _startTime = null;
    _pauseTime = null;
    _scheduledPauseDuration = null;
    notifyListeners();
  }

  void reset() {
    stop();
    _elapsedTime = Duration.zero;
    notifyListeners();
  }

  void addTime(Duration duration) {
    _elapsedTime = _elapsedTime + duration;
    if (_startTime != null) {
      _startTime = _startTime!.subtract(duration);
    }
    notifyListeners();
  }

  void resetElapsedTime() {
    _elapsedTime = Duration.zero;
    if (_isRunning && !_isPaused) {
      _startTime = DateTime.now();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
