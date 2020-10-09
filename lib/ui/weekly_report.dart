import 'package:flutter/material.dart';
import 'package:hospital_staff_data/models/daliy_data.dart';
import 'package:hospital_staff_data/models/week_data.dart';
import 'package:hospital_staff_data/ui/widgets/header_cell.dart';
import 'package:hospital_staff_data/utils/shift_convert.dart';

class WeekReportView extends StatefulWidget {
  final WeekData weekData;
  final String week;

  const WeekReportView({Key key,@required this.weekData,@required this.week}) : super(key: key);
  @override
  _WeekReportViewState createState() => _WeekReportViewState();
}

class _WeekReportViewState extends State<WeekReportView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.week}  ${widget.weekData.startTime.year}-${widget.weekData.startTime.month}-${widget.weekData.startTime.day} '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.weekData == null
            ? CircularProgressIndicator()
            : ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      defaultColumnWidth: FixedColumnWidth(150.0),
                      border: TableBorder.all(
                          color: Colors.black26,
                          width: 2,
                          style: BorderStyle.solid,),
                      children: [
                        TableRow(
                            decoration: BoxDecoration(color: Colors.teal),
                            children: [
                              TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Shifts',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))),
                              HeaderCell(text: Utils().printDuration(widget.weekData.shift1)),
                              HeaderCell(text: Utils().printDuration(widget.weekData.shift2)),
                              HeaderCell(text: Utils().printDuration(widget.weekData.shift3)),
                            ]),
                        ...buildRows(widget.weekData.dailyData)
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

 

  buildRows(List<DailyData> dailyDataList) {
    return dailyDataList.map((day) => buildRow(day)).toList();
  }

  buildRow(DailyData day) {
    return TableRow(children: [
      TableCell(
        child: Center(
            child: Text(
          '${day.day}',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),
        )),
        verticalAlignment: TableCellVerticalAlignment.bottom,
      ),
      buildShift(day.shift1),
      buildShift(day.shift2),
      buildShift(day.shift3),
    ]);
  }

  buildShift(List<String> name) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: List.generate(
              name.length,
              (index) => Text(
                    name[index],
                    textAlign: TextAlign.center,
                  )),
        ),
      )),
    );
  }
}
