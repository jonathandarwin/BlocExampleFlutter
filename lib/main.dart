import 'package:bloc_example/main_bloc.dart';
import 'package:bloc_example/main_event.dart';
import 'package:bloc_example/main_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "BLoC Example",
      home: RootLayout()
    );
  }
}

class RootLayout extends StatelessWidget{

  final _bloc = MainBloc();  

  @override
  Widget build(BuildContext context){  
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Example"),        
      ),
      body: StreamBuilder(
        stream: _bloc.model,
        initialData: MainModel()
          .setBackground(Colors.white)
          .setColor(Colors.black)
          .setText("On"),
        builder: (context, snapshot){
          MainModel model = snapshot.data;
          return Container(
            color: model.background,
            child: Center(
              child: Text('${model.text}',
                style: TextStyle(
                  color: model.color
                )),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.setEvent.add(_bloc.getModel.text == "On" ? MainEvent.OFF : MainEvent.ON),
        child: Icon(Icons.lightbulb_outline),
      ),
    );
  }
}