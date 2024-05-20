import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/models/update_task_model.dart';
import 'package:tasks/features/home/domain/repositories/home_repo.dart';

class UpdateTaskUseCase {
  HomeRepo homeRepo;

  UpdateTaskUseCase(this.homeRepo);

  Future<Either<Failures, UpdateTaskModel>> call(
          bool completed, String postId) =>
      homeRepo.updateTask(completed, postId);
}
