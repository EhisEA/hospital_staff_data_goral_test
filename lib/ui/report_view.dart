import 'package:flutter/material.dart';
import 'package:hospital_staff_data/models/week_data.dart';
import 'package:hospital_staff_data/services/fetchData.dart';
import 'package:hospital_staff_data/ui/widgets/report_widget.dart';

class ReportView extends StatefulWidget {
  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  List<WeekData> reports;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData()async{
    reports = [];
    Map data = await FetchDataService().getData();

    data["data"].forEach((data) {
      reports.add(WeekData.fromJson(data));
    });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:loadData,        
        child: Icon(Icons.replay),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: reports == null || reports.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  return ReportWidget(
                    color: index.isEven
                        ? Colors.teal.shade200
                        : Colors.teal.shade400,
                    text: "Week ${index + 1}",
                    data: reports[index],
                  );
                },
              ),
      ),
    );
  }
}
