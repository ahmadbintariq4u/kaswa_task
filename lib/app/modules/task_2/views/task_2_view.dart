import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/models/data_model_model.dart';
import '../controllers/task_2_controller.dart';

class Task2View extends GetView<Task2Controller> {
  const Task2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2 (API Flow)'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kHeight,
          'Calling Data from the API'.text.uppercase.bold.makeCentered(),
          kHeight,
          Expanded(
            child: FutureBuilder<DataModel>(
              future: controller.repo.getAll(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            snapshot.data.data[index].slugNation.toString()),
                        subtitle: Text(
                            snapshot.data.data[index].population.toString()),
                      );
                    },
                  );
                }

                return const Text("Something wrong happens");
              },
            ),
          ),
        ],
      ),
    );
  }
}
