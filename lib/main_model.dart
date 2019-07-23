import 'package:flutter/material.dart';

class MainModel{
  String text;
  Color background;
  Color color;

  MainModel setText(String text){
    this.text = text;
    return this;
  }

  MainModel setBackground(Color background){
    this.background = background;
    return this;
  }

  MainModel setColor(Color color){
    this.color = color;
    return this;
  }  

  MainModel({
    this.text,
    this.background,
    this.color
  });
}