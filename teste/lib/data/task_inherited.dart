import 'package:flutter/material.dart';
import 'package:teste/components/task.dart';

class TaskInherited extends InheritedWidget {
  ///teste
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
     Task('Jogar de Genji', 1, 'assets/images/flutter_overwatch2/genji.webp'),
     Task('Jogar de Hanzo', 2, 'assets/images/flutter_overwatch2/hanzo.webp'),
     Task('Jogar de Ana', 3, 'assets/images/flutter_overwatch2/ana.webp'),
     Task('Jogar de Zenyatta', 4,
        'assets/images/flutter_overwatch2/zenyatta.webp'),
     Task('Jogar de Lucio', 5, 'assets/images/flutter_overwatch2/lucio.webp'),
  ];

  newTask(String name, int difficulty, String photo){
    taskList.add(Task(name, difficulty, photo));
  }
  static TaskInherited of(BuildContext context) {
    final result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length!= taskList.length;
  }
}
