import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/models/index.dart';

class StorageService {
  static const String _tasksKey = 'tasks_data';

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks
        .map(
          (task) => {
            'name': task.name,
            'trackedTime': task.trackedTime.inSeconds,
          },
        )
        .toList();
    await prefs.setString(_tasksKey, jsonEncode(tasksJson));
  }

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJsonString = prefs.getString(_tasksKey);
    if (tasksJsonString == null) {
      return [];
    }
    try {
      final tasksJson = jsonDecode(tasksJsonString) as List<dynamic>;
      return tasksJson.map((json) {
        return Task(
          name: json['name'] as String,
          trackedTime: Duration(seconds: json['trackedTime'] as int),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> clearTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
  }
}
