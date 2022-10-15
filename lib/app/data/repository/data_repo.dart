import 'package:kaswa_task/app/data/providers/data_model_provider.dart';

import '../models/data_model_model.dart';

class MyModelRepository {
  Future<DataModel> getAll() async {
    final dataModelProvider = DataModelProvider();
    final result = await dataModelProvider.getData();
    return Future<DataModel>.value(result);
  }
}
