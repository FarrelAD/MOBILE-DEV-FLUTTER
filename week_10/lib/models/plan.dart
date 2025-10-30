import 'package:week_10/models/task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  Plan({this.name = '', this.tasks = const []});

  int get completedCount {
    return tasks.where((task) => task.complete).length;
  }

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
