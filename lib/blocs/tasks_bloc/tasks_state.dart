part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Tasks> pendingTasks;
  final List<Tasks> completedTasks;
  final List<Tasks> favoriteTasks;
  final List<Tasks> removedTasks;
  const TasksState({
    this.pendingTasks = const <Tasks>[],
    this.completedTasks = const <Tasks>[],
    this.favoriteTasks = const <Tasks>[],
    this.removedTasks = const <Tasks>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks':
          pendingTasks.map((pendingTask) => pendingTask.toJson()).toList(),
      'completedTasks': completedTasks
          .map((completedTask) => completedTask.toJson())
          .toList(),
      'favoriteTasks':
          favoriteTasks.map((favoriteTask) => favoriteTask.toJson()).toList(),
      'removedTasks':
          removedTasks.map((removedTask) => removedTask.toJson()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks:
          List<Tasks>.from(map['pendingTasks']?.map((x) => Tasks.fromMap(x))),
      completedTasks:
          List<Tasks>.from(map['completedTasks']?.map((x) => Tasks.fromMap(x))),
      favoriteTasks:
          List<Tasks>.from(map['favoriteTasks']?.map((x) => Tasks.fromMap(x))),
      removedTasks:
          List<Tasks>.from(map['removedTasks']?.map((x) => Tasks.fromMap(x))),
    );
  }
}
