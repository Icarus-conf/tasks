import 'package:dartz/dartz.dart';
import 'package:tasks/core/cache/shared_pref.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/data_sources/home_ds.dart';
import 'package:tasks/features/home/data/models/add_task_model.dart';
import 'package:tasks/features/home/data/models/delete_task_model.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';
import 'package:tasks/features/home/data/models/update_task_model.dart';
import 'package:tasks/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeDS homeDS;
  HomeRepoImpl(this.homeDS);
  @override
  Future<Either<Failures, TasksModel>> getTasks(int userId) async {
    try {
      var result = await homeDS.getTasks(userId);
      CacheHelper.saveTodos(result.todos!.map((e) => e.todo ?? '').toList());
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddTaskModel>> addTask(
      String todo, String userId, bool completed) async {
    try {
      var result = await homeDS.addTask(todo, userId, completed);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UpdateTaskModel>> updateTask(
      bool completed, postId) async {
    try {
      var result = await homeDS.updateTask(completed, postId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteTaskModel>> deleteTask(postId) async {
    try {
      var result = await homeDS.deleteTask(postId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
