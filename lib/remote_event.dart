abstract class RemoteEvent {}

// event tăng âm lượng
class IncrementVolumeEvent extends RemoteEvent {
  IncrementVolumeEvent(this.increment);

  final int increment;
}

// event giảm âm lượng
class DecrementVolumeEvent extends RemoteEvent {
  final int decrement;

  DecrementVolumeEvent(this.decrement);
}

// event tắt tiếng
class MuteVolumeEvent extends RemoteEvent {}
