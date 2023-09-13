import 'package:demo_bloc/call_api/task_model.dart';
import 'package:dio/dio.dart';

class ApiControllerJson {

  Future<List<CongViec>> fetchData() async {
    Dio dio = Dio();
    var listTask = <CongViec>[];
    Response response = await dio.get("http://192.168.1.39:3000/api/congviec/list");

    if(response.statusCode == 200){
      List<dynamic> listData = response.data;

      listTask = listData.map((e) => CongViec.fromJson(e)).toList();

      return listTask;
    } else {
      throw Exception("Failed to load tasks");
    }
  }
}