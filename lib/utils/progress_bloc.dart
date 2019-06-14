import 'package:rxdart/rxdart.dart';

class ProgressBloc {
  final controller = BehaviorSubject<bool>();

  get stream => controller.stream;

  void setProgress(bool b) {
    controller.sink.add(b);
  }

//  void setProgressNull(bool b) {
//    _progressController.sink.add(null);
//  }

  close() {
    controller.close();
  }
}
