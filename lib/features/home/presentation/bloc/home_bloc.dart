import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks/core/enums/request_status.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';

import '../../domain/use_cases/get_tasks_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetTasksUseCase getTasksUseCase;
  HomeBloc(this.getTasksUseCase) : super(const HomeState()) {
    on<GetTasksEvent>((event, emit) async {
      emit(state.copyWith(
        getTasks: RequestStatus.loading,
      ));

      var result = await getTasksUseCase(event.userId);

      result.fold((l) {
        emit(state.copyWith(
          getTasks: RequestStatus.failure,
          getTasksFailures: l,
        ));
      }, (r) {
        emit(state.copyWith(getTasks: RequestStatus.success, tasksModel: r));
      });
    });
  }
}
