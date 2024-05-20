import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/enums/request_status.dart';
import 'package:tasks/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:tasks/features/home/data/data_sources/home_ds_impl.dart';
import 'package:tasks/features/home/data/repositories_impl/home_repo_impl.dart';
import 'package:tasks/features/home/domain/use_cases/get_tasks_usecase.dart';
import 'package:tasks/features/home/presentation/bloc/home_bloc.dart';
import 'package:tasks/features/home/presentation/widgets/task_item_decoration_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetTasksUseCase(
          HomeRepoImpl(
            HomeDSImpl(),
          ),
        ),
      )..add(const GetTasksEvent(15)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tasks',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          const Text(
                            'Add task',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const CustomTextField(
                            label: 'What to do?',
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.getTasks == RequestStatus.failure) {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Text(state.getTasksFailures?.message ?? ""),
                  );
                },
              );
            }
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.tasksModel?.todos?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  child: TaskItemDecoration(
                    task: state.tasksModel?.todos?[index].todo ?? '',
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
