import 'package:flutter/material.dart';

class TableRowWidget {
  TableRow build(day) {
    return TableRow(
      children: [
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