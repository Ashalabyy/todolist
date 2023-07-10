import 'package:cloud_firestore/cloud_firestore.dart';
import './../services/UserToken.dart';
import '../models/task.dart';

class TasksRepositiories {
  static Future<void> CreateTask(Tasks? tasks) async {
    String? token = await Authorization.getToken();
    await FirebaseFirestore.instance.collection(token!).doc(tasks!.id).set(
          tasks.toJson(),
        );
  }

  static Future<List<Tasks>> getTask() async {
    String? token = await Authorization.getToken();
    List<Tasks> tasksLists = [];
    try {
      final data = await FirebaseFirestore.instance.collection(token!).get();

      for (var task in data.docs) {
        tasksLists.add(Tasks.fromMap(task.data()));
      }
      return tasksLists;
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> updateTask(Tasks? tasks) async {
    String? token = await Authorization.getToken();
    List<Tasks> tasksLists = [];
    try {
      final data = await FirebaseFirestore.instance.collection(token!);
      data.doc(tasks!.id).update(tasks.toJson());
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> DeleteTask(Tasks? tasks) async {
    String? token = await Authorization.getToken();

    try {
      final data = await FirebaseFirestore.instance.collection(token!);
      data.doc(tasks!.id).delete();
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> DeleteAllTask(List<Tasks>? tasks) async {
    String? token = await Authorization.getToken();

    try {
      final data = await FirebaseFirestore.instance.collection(token!);
      for (var task in tasks!) {
        data.doc(task.id).delete();
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
