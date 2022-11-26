import 'dart:async';
import 'dart:developer';

import '../home_reop/home_repo.dart';

class HomeDataBloc {
  late HomeRepository homeRepository;

  late StreamController<dynamic> _streamController;
  late StreamController<dynamic> gethomecontroller;

  HomeDataBloc() {
    _streamController = StreamController<dynamic>();
    gethomecontroller = StreamController<dynamic>();

    homeRepository = HomeRepository();
  }

  StreamSink<dynamic> get gethomeSink => gethomecontroller.sink;

  Stream<dynamic> get gethomeStream => gethomecontroller.stream;

  callhomeData() async {
    try {
      final response = await homeRepository.gethome();

      gethomeSink.add(response);
    } catch (e) {
      gethomeSink.add('error');
    }
  }

  dispose() {
    _streamController.close();
  }
}
