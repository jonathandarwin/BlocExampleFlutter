import 'package:bloc_example/main_event.dart';
import 'package:bloc_example/main_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MainBloc{
  MainModel _model;

  MainModel get getModel => _model;  

  // CONTROLLER FOR HANDLING THE INCOME EVENT
  final _mainEventController = StreamController<int>();
  Sink<int> get setEvent => _mainEventController.sink;

  // STREAM AND SINK FOR MAIN MODEL
  final _modelStateController = StreamController<MainModel>();
  StreamSink<MainModel> get _setState => _modelStateController.sink;
  Stream<MainModel> get model => _modelStateController.stream;

  MainBloc(){
    _mainEventController.stream.listen(handleEvent);
    _model = MainModel().setBackground(Colors.white)
                .setColor(Colors.black)
                .setText("On");
  }

  void handleEvent(int event){    
    if(event == MainEvent.ON){
      _model.setBackground(Colors.white)
        .setColor(Colors.black)
        .setText("On");
    }
    else if (event == MainEvent.OFF){      
      _model.setBackground(Colors.black)
        .setColor(Colors.white)
        .setText("Off");
    }

    _setState.add(_model);
  }
}