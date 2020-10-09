import 'package:flutter/material.dart';

class DailyData {
  String day;
  List<String> shift1, shift2, shift3;

  DailyData({this.day, this.shift1, this.shift2, this.shift3});

  DailyData.fromJson({ @required Map data, @required String day}) {
    this.day = day;
    shift1=[];
    shift2=[];
    shift3=[];

    data["1"].forEach((value){
      shift1.add(value);
    });

    data["2"].forEach((value){
      shift2.add(value);
    });

    data["3"].forEach((value){
      shift3.add(value);
    });

  }
}
