import 'dart:async';

import 'package:demo_bloc/call_api/api_controller_json.dart';

class DemoBloc implements Bloc {
  final StreamController _apiController = StreamController<List>();

  Stream<List>? get apiController => _apiController.stream as Stream<List>?;

  @override
  void dispose() {
    _apiController.close();
  }

  getData() async {
    ApiControllerJson apiControllerJson = ApiControllerJson();
    List data = await apiControllerJson.fetchData();

    _apiController.sink.add(data);

  }
}

abstract class Bloc {
  void dispose();
}
