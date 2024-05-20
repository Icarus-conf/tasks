part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init) RequestStatus getTasks,
    Failures? getTasksFailures,
    TasksModel? tasksModel,
  }) = _HomeState;
}
