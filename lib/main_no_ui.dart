import 'package:demo_bloc/remote_bloc.dart';
import 'package:demo_bloc/remote_event.dart';
import 'package:demo_bloc/remote_state.dart';
import 'package:flutter/material.dart';

void main() async {
  // runApp(const MyApp());
  final bloc = RemoteBloc();

  bloc.stateController.stream.listen(
    (RemoteState state) {
      print("Âm lượng hiện tại: ${state.volume}");
    },
  );

  // giả sử 1s sau user bấm tăng thì sự kiện tăng âm sẽ được thêm vào stream event và gửi đến bloc xử lý
  await Future.delayed(Duration(seconds: 1));
  bloc.eventController.sink.add(IncrementVolumeEvent(5));

  // giả sử 2s sau user bấm tăng thì sự kiện giảm âm sẽ được thêm vào stream event và gửi đến bloc xử lý
  await Future.delayed(Duration(seconds: 2));
  bloc.eventController.sink.add(DecrementVolumeEvent(10));

  // giả sử 3s sau user bấm tăng thì sự kiện tắt âm sẽ được thêm vào stream event và gửi đến bloc xử lý
  await Future.delayed(Duration(seconds: 3));
  bloc.eventController.sink.add(MuteVolumeEvent());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
