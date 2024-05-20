import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';
import 'package:tasks/features/home/domain/repositories/home_repo.dart';

class GetTasksUseCase {
  HomeRepo homeRepo;

  GetTasksUseCase(this.homeRepo);

  Future<Either<Failures, TasksModel>> call(int userId) =>
      homeRepo.getTasks(userId);
}
