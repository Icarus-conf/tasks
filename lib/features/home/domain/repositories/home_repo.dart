import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/models/add_task_model.dart';
import 'package:tasks/features/home/data/models/delete_task_model.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';
import 'package:tasks/features/home/data/models/update_task_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, TasksModel>> getTasks(int userId);
  Future<Either<Failures, AddTaskModel>> addTask(
      String todo, String userId, bool completed);
  Future<Either<Failures, UpdateTaskModel>> updateTask(bool completed, postId);
  Future<Either<Failures, DeleteTaskModel>> deleteTask(postId);
}
