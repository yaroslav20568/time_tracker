import 'package:flutter/material.dart';
import 'package:time_tracker/constants/index.dart';
import 'package:time_tracker/widgets/ui/index.dart';

class TaskControlButtons extends StatelessWidget {
  final bool isTracking;
  final bool isPaused;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onStop;
  final VoidCallback? onPauseMenu;

  const TaskControlButtons({
    super.key,
    this.isTracking = false,
    this.isPaused = false,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onStop,
    this.onPauseMenu,
  });

  @override
  Widget build(BuildContext context) {
    if (!isTracking) {
      return AppButton(
        label: 'Start Tracking',
        icon: Icons.play_arrow,
        onPressed: onStart,
        variant: AppButtonVariant.primary,
        isFullWidth: true,
      );
    }

    return Row(
      children: [
        if (isPaused)
          Expanded(
            child: AppButton(
              label: 'Resume',
              icon: Icons.play_arrow,
              onPressed: onResume,
              variant: AppButtonVariant.primary,
            ),
          )
        else
          Expanded(
            child: AppButton(
              label: 'Pause',
              icon: Icons.pause,
              onPressed: onPause,
              variant: AppButtonVariant.secondary,
            ),
          ),
        if (!isPaused) ...[
          const SizedBox(width: 8),
          IconButton(
            onPressed: onPauseMenu,
            icon: const Icon(Icons.more_vert),
            color: AppColors.textSecondary,
          ),
        ],
        const SizedBox(width: 8),
        IconButton(
          onPressed: onStop,
          icon: const Icon(Icons.stop),
          color: AppColors.error,
        ),
      ],
    );
  }
}
