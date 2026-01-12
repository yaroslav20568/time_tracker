import 'package:flutter/material.dart';
import 'package:time_tracker/constants/index.dart';

class PauseMenuDialog extends StatelessWidget {
  final VoidCallback? onPauseNow;
  final VoidCallback? onPause15;
  final VoidCallback? onPause30;
  final VoidCallback? onPause45;

  const PauseMenuDialog({
    super.key,
    this.onPauseNow,
    this.onPause15,
    this.onPause30,
    this.onPause45,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Pause',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Pause tracking automatically after:',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            _PauseOption(
              label: 'Pause Now',
              onTap: () {
                Navigator.of(context).pop();
                onPauseNow?.call();
              },
            ),
            const SizedBox(height: 12),
            _PauseOption(
              label: '15 minutes',
              onTap: () {
                Navigator.of(context).pop();
                onPause15?.call();
              },
            ),
            const SizedBox(height: 12),
            _PauseOption(
              label: '30 minutes',
              onTap: () {
                Navigator.of(context).pop();
                onPause30?.call();
              },
            ),
            const SizedBox(height: 12),
            _PauseOption(
              label: '45 minutes',
              onTap: () {
                Navigator.of(context).pop();
                onPause45?.call();
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PauseOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PauseOption({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
