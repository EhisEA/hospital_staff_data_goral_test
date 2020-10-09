import 'package:flutter/material.dart';
import 'package:hospital_staff_data/constant/routingConstants.dart';
import 'package:hospital_staff_data/ui/undefinedRoute.dart';
import 'package:hospital_staff_data/ui/weekly_report.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WeekReportViewRoute:
        Map data = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => WeekReportView(
            week: data["week"],
            weekData: data["weekData"],
          ),
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedRoute(name: settings.name));
    }
  }
}
