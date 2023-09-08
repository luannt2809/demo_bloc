import 'dart:async';

import 'package:demo_bloc/remote_event.dart';
import 'package:demo_bloc/remote_state.dart';

class RemoteBloc {
  // khởi tạo giá trị đầu tiên cho state
  var state = RemoteState(70);

  // tạo 2 controller
  final eventController =
      StreamController<RemoteEvent>(); // controller này để nhận event từ UI

  final stateController = StreamController<
      RemoteState>(); // controller này để quản lý state, có vai trò truyền state cho UI

  RemoteBloc() {
    // lắng nghe eventController khi có sự kiện
    eventController.stream.listen(
      (event) {
        // nếu event là tăng âm (IncrementVolumeEvent) thì set state là tăng âm
        if (event is IncrementVolumeEvent) {
          state = RemoteState(state.volume + event.increment);
        // nếu event là giảm âm (DecrementVolumeEvent) thì set state là giảm âm
        } else if (event is DecrementVolumeEvent) {
          state = RemoteState(state.volume - event.decrement);
        // nếu event là tắt âm (MuteVolume) thì set state là tắt âm (0)
        } else {
          state = RemoteState(0);
        }
        stateController.sink.add(state);
      },
    );
  }

  // dùng xong thì đóng stream
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
