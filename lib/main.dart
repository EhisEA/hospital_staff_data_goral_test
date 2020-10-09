import 'package:flutter/material.dart';
import 'package:hospital_staff_data/router.dart';
import 'package:hospital_staff_data/services/dialog_service.dart';
import 'package:hospital_staff_data/services/navigationService.dart';

import 'ui/report_view.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';

void main() {
  setupLocator(); //*====registaring get_it
  return runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        builder: (context, child) {
          var dialogService = locator<DialogService>();
          return Navigator(
            key: dialogService.dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          );
        },
        onGenerateRoute: Router.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: ReportView());
  }
}
