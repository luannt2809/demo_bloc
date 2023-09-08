import 'package:demo_bloc/remote_bloc.dart';
import 'package:demo_bloc/remote_event.dart';
import 'package:demo_bloc/remote_state.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
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
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // khởi tạo bloc
  final bloc = RemoteBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // sử dụng widget StreamBuilder để lắng nghe trạng thái của state
        child: StreamBuilder<RemoteState>(
          stream: bloc.stateController.stream, // truyền stream vào để lắng nghe
          initialData: bloc.state, //giá trị khởi đầu của state
          builder:
              (BuildContext context, AsyncSnapshot<RemoteState> snaphshot) {
            return Text("Âm lượng hiện tại: ${snaphshot.data!.volume}"); // update UI
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                bloc.eventController.sink.add(IncrementVolumeEvent(5)), // khi click thì sẽ nhận sự kiện tăng âm vào thêm vào stream event gửi cho bloc
            child: const Icon(Icons.volume_up),
          ),
          FloatingActionButton(
            onPressed: () =>
                bloc.eventController.sink.add(DecrementVolumeEvent(10)), // khi click thì sẽ nhận sự kiện tăng âm vào thêm vào stream event gửi cho bloc
            child: const Icon(Icons.volume_down),
          ),
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(MuteVolumeEvent()), // khi click thì sẽ nhận sự kiện tắt âm thêm vào stream event gửi cho bloc
            child: const Icon(Icons.volume_mute),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }
}
