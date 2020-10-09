import 'package:flutter/material.dart';
import 'package:hospital_staff_data/constant/routingConstants.dart';
import 'package:hospital_staff_data/locator.dart';
import 'package:hospital_staff_data/models/week_data.dart';
import 'package:hospital_staff_data/services/navigationService.dart';

class ReportWidget extends StatelessWidget {
  final Color color;
  final String text;
  final WeekData data;
  const ReportWidget(
      {Key key, @required this.color, @required this.text, @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return InkWell(
      onTap: () {
        _navigationService.navigateTo(WeekReportViewRoute,
            argument: {"week": text, "weekData": data});
      },
      child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
          )),
    );
  }
}
