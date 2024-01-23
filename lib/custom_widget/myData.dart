// import 'dart:math';

import 'package:flutter/material.dart';

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "name": "Name $index",
            "hour": index,
            "km": index,
            "created_date": DateTime.now(),
            "status": 'true',
            "action": Icon(Icons.abc),
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(onSelectChanged: (selected) {}, cells: [
      DataCell(Text('ramkewal')),
      DataCell(Text('1')),
      DataCell(Text('10')),
      DataCell(Text('23-1-2024')),
      DataCell(Container(
          width: 45,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.green),
          child: Center(
              child: Text(
            'true',
            style: TextStyle(color: Colors.white),
          )))),
      DataCell(
        Center(
          child: PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("View"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Delete"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  print("Logout menu is selected.");
                }
              }),
        ),
      ),
    ]);
  }
}
