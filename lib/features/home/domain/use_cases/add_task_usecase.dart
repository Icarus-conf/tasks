import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/models/add_task_model.dart';
import 'package:tasks/features/home/domain/repositories/home_repo.dart';

class AddTaskUseCase {
  HomeRepo homeRepo;

  AddTaskUseCase(this.homeRepo);

  Future<Either<Failures, AddTaskModel>> call(
          String todo, String userId, bool completed) =>
      homeRepo.addTask(todo, userId, completed);
}
