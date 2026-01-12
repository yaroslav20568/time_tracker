import 'package:flutter/material.dart';
import 'package:time_tracker/constants/index.dart';
import 'package:time_tracker/services/index.dart';
import 'package:time_tracker/widgets/index.dart';

class TimeTrackerScreen extends StatefulWidget {
  const TimeTrackerScreen({super.key});

  @override
  State<TimeTrackerScreen> createState() => _TimeTrackerScreenState();
}

class _TimeTrackerScreenState extends State<TimeTrackerScreen> {
  late final TaskService _taskService;

  @override
  void initState() {
    super.initState();
    _taskService = TaskService();
    _taskService.addListener(_onTaskServiceUpdate);
  }

  @override
  void dispose() {
    _taskService.removeListener(_onTaskServiceUpdate);
    _taskService.dispose();
    super.dispose();
  }

  void _onTaskServiceUpdate() {
    setState(() {});
  }

  void _showPauseMenu() {
    showDialog(
      context: context,
      builder: (context) => PauseMenuDialog(
        onPauseNow: () {
          _taskService.pauseTracking();
        },
        onPause15: () {
          _taskService.schedulePause(const Duration(minutes: 15));
        },
        onPause30: () {
          _taskService.schedulePause(const Duration(minutes: 30));
        },
        onPause45: () {
          _taskService.schedulePause(const Duration(minutes: 45));
        },
      ),
    );
  }

  Duration? _getCurrentTime(int index) {
    final task = _taskService.tasks[index];
    if (_taskService.activeTask?.name == task.name &&
        _taskService.activeTimer != null) {
      return _taskService.activeTimer!.elapsedTime;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Time Tracker'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _taskService.tasks.length,
        itemBuilder: (context, index) {
          final task = _taskService.tasks[index];
          final isActive =
              _taskService.activeTask?.name == task.name && task.isTracking;
          final currentTime = _getCurrentTime(index);

          return TaskCard(
            task: task,
            isActive: isActive,
            currentTime: currentTime,
            onStart: () => _taskService.startTracking(index),
            onPause: () => _taskService.pauseTracking(),
            onResume: () => _taskService.resumeTracking(),
            onStop: () => _taskService.stopTracking(),
            onPauseMenu: _showPauseMenu,
          );
        },
      ),
    );
  }
}
