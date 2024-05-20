import 'package:tasks/features/home/data/models/add_task_model.dart';
import 'package:tasks/features/home/data/models/delete_task_model.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';
import 'package:tasks/features/home/data/models/update_task_model.dart';

abstract class HomeDS {
  Future<TasksModel> getTasks(int userId);
  Future<AddTaskModel> addTask(String todo, String userId, bool completed);
  Future<UpdateTaskModel> updateTask(bool completed, String postId);
  Future<DeleteTaskModel> deleteTask(String postId);
}
