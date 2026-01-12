import 'package:flutter/material.dart';
import 'package:time_tracker/models/index.dart';
import 'package:time_tracker/constants/index.dart';
import 'package:time_tracker/widgets/time_tracker_screen/timer_display.dart';
import 'package:time_tracker/widgets/time_tracker_screen/task_control_buttons.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final bool isActive;
  final Duration? currentTime;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onStop;
  final VoidCallback? onPauseMenu;

  const TaskCard({
    super.key,
    required this.task,
    this.isActive = false,
    this.currentTime,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onStop,
    this.onPauseMenu,
  });

  Duration get _displayTime {
    if (isActive && currentTime != null) {
      return task.trackedTime + currentTime!;
    }
    return task.trackedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      color: isActive
          ? AppColors.primary.withValues(alpha: 0.1)
          : AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      task.isPaused ? 'Paused' : 'Tracking',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            TimerDisplay(
              duration: _displayTime,
              isActive: isActive,
            ),
            const SizedBox(height: 12),
            TaskControlButtons(
              isTracking: task.isTracking,
              isPaused: task.isPaused,
              onStart: onStart,
              onPause: onPause,
              onResume: onResume,
              onStop: onStop,
              onPauseMenu: onPauseMenu,
            ),
          ],
        ),
      ),
    );
  }
}
