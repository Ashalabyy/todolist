import 'package:equatable/equatable.dart';
import 'package:todolist/services/TasksRepositiories.dart';
import '../../models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<GetAllTasks>(_onGetAllTasks);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTasks>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    await TasksRepositiories.CreateTask(event.task);
  }

  void _onGetAllTasks(GetAllTasks event, Emitter<TasksState> emit) async {
    List<Tasks> pendingTasks = [];
    List<Tasks> favoriteTasks = [];
    List<Tasks> removedTasks = [];
    List<Tasks> completedTasks = [];

    await TasksRepositiories.getTask().then((value) {
      value.forEach((task) {
        if (task.isDeleted == true) {
          removedTasks.add(task);
        } else {
          if (task.isDone == true) {
            completedTasks.add(task);
          }
          if (task.isFavorite == true) {
            favoriteTasks.add(task);
          } else {
            pendingTasks.add(task);
          }
        }
      });
    });

    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removedTasks: removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) async {
    Tasks UpdatedTask = event.task.copyWith(isDone: !event.task.isDone!);
    await TasksRepositiories.updateTask(UpdatedTask);
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    await TasksRepositiories.DeleteTask(event.task);
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) async {
    Tasks UpdatedTask = event.task.copyWith(isDeleted: !event.task.isDeleted!);
    await TasksRepositiories.updateTask(UpdatedTask);
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) async {
    Tasks UpdatedTask =
        event.task.copyWith(isFavorite: !event.task.isFavorite!);
    await TasksRepositiories.updateTask(UpdatedTask);
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {}

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) async {
    Tasks UpdatedTask = event.task.copyWith(isDeleted: !event.task.isDeleted!);
    await TasksRepositiories.updateTask(UpdatedTask);
  }

  void _onDeleteAllTask(DeleteAllTasks event, Emitter<TasksState> emit) async {
    await TasksRepositiories.DeleteAllTask(state.removedTasks);
  }
}
