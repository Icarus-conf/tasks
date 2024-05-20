import 'package:tasks/core/api/api_magner.dart';
import 'package:tasks/core/api/end_points.dart';
import 'package:tasks/features/home/data/data_sources/home_ds.dart';
import 'package:tasks/features/home/data/models/add_task_model.dart';
import 'package:tasks/features/home/data/models/delete_task_model.dart';
import 'package:tasks/features/home/data/models/tasks_model.dart';
import 'package:tasks/features/home/data/models/update_task_model.dart';

class HomeDSImpl implements HomeDS {
  ApiManger apiManger = ApiManger();
  @override
  Future<TasksModel> getTasks(int userId) async {
    var response = await apiManger.getData(
      endPoint: '${EndPoints.getTasksEndPoint}/$userId',
    );

    TasksModel tasksModel = TasksModel.fromJson(response.data);

    return tasksModel;
  }

  @override
  Future<AddTaskModel> addTask(
      String todo, String userId, bool completed) async {
    var response =
        await apiManger.postData(endPoint: EndPoints.addTaskEndPoint, body: {
      'todo': todo,
      'completed': completed,
      'userId': userId,
    });

    AddTaskModel addTaskModel = AddTaskModel.fromJson(response.data);

    return addTaskModel;
  }

  @override
  Future<UpdateTaskModel> updateTask(bool completed, String postId) async {
    var response = await apiManger
        .putData(endPoint: '${EndPoints.updateTaskEndPoint}$postId', body: {
      'completed': completed,
    });

    UpdateTaskModel updateTaskModel = UpdateTaskModel.fromJson(response.data);

    return updateTaskModel;
  }

  @override
  Future<DeleteTaskModel> deleteTask(String postId) async {
    var response = await apiManger.deleteData(
      '${EndPoints.deleteTaskEndPoint}$postId',
    );

    DeleteTaskModel deleteTaskModel = DeleteTaskModel.fromJson(response.data);

    return deleteTaskModel;
  }
}
