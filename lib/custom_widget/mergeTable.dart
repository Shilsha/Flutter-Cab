import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Text('Cell 1'),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Text('Cell 2'),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Text('Cell 3'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            // Merged Cells (colspan: 2)
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Merged Cells',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Cell 4'),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Cell 4'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Cell 5'),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Cell 6'),
              ),
            ),
            TableCell(
              child: Container(
                alignment: Alignment.center,
                child: Text('Cell 7'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
