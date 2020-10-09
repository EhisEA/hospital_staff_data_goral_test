import 'package:hospital_staff_data/models/daliy_data.dart';

class WeekData{
  List<String> days;
  Shift shift1, shift2, shift3;
  List<DailyData> dailyData;
  DateTime startTime;
  DateTime stopTime;
  

  WeekData({this.shift1, this.shift2, this.shift3, this.dailyData, this.days});

  WeekData.fromJson(Map data){

    startTime= DateTime.fromMillisecondsSinceEpoch(data["valid"]["start"]);
    stopTime= DateTime.fromMillisecondsSinceEpoch(data["valid"]["stop"]);
    days=[];
    dailyData=[];
    data["openingDays"].forEach((value){
      days.add(value);
    });
    shift1= Shift.fromJson(data["shifts"][0]);
    shift2= Shift.fromJson(data["shifts"][1]);
    shift3= Shift.fromJson(data["shifts"][2]);

    days.forEach((day){
      dailyData.add(DailyData.fromJson(day: day, data: data["staffRoster"][day]));
    });
  }
}

class Shift{

  Duration start;
  Duration stop;

  Shift(this.start, this.stop);

  Shift.fromJson(Map data){
    var startTime=data["start"][0];
    var endTime=data["stop"][0];
    start= Duration(hours: startTime["hour"], minutes:startTime["minute"] );
    stop= Duration(hours: endTime["hour"], minutes:endTime["minute"]);


  }
}