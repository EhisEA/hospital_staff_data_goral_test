import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final String text;
  const HeaderCell({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.bottom,
      child: Center(
          child: Text(
        '$text',
        style: TextStyle(
            color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w700),
      )),
    );
  }
}
