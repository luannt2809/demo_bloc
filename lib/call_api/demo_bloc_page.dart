import 'package:demo_bloc/call_api/demo_bloc.dart';
import 'package:demo_bloc/call_api/task_model.dart';
import 'package:flutter/material.dart';

class DemoBlocPage extends StatefulWidget {
  const DemoBlocPage({super.key});

  @override
  State<DemoBlocPage> createState() => _DemoBlocPageState();
}

class _DemoBlocPageState extends State<DemoBlocPage> {
  List list = [];

  DemoBloc demoBloc = DemoBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    demoBloc.getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    demoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Fetch Data Using Bloc"),
      ),
      body: SafeArea(
        child: StreamBuilder<List>(
          stream: demoBloc.apiController,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasData) {
                  list = snapshot.data!;
                }

                return ListView.builder(
                  itemBuilder: (context, index) {
                    CongViec congViec = list[index];
                    return Column(
                      children: [
                        Text(congViec.tieuDe.toString()),
                        Text(congViec.noiDung.toString())
                      ],
                    );
                  },
                  itemCount: list.length,
                );
            }
          },
        ),
      ),
    );
  }
}
