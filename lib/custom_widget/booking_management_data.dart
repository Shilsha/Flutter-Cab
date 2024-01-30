import 'package:flutter/material.dart';
import 'package:flutter_cab/viewpages/vendor-side/view_booking_screen.dart';

class BookinMyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "name": "Name ",
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
    return DataRow(cells: [
      DataCell(Center(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromRGBO(241, 241, 237, 0.933),
            child: Image.asset('assets/images/driver.webp'),
          ),
          title: Text('Ramkewal'),
          subtitle: Text('ramkewal@gamail.com'),
        ),
      )),
      DataCell(Text('Rental')),
      DataCell(Text('Noida utter pradesh')),
      DataCell(Text('10:20')),
      DataCell(Text('SEDAN')),
      DataCell(Text('4')),
      DataCell(Text('petrol')),
      DataCell(Text('23-1-2024')),
      DataCell(Container(
          width: 100,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.green),
          child: Center(
              child: Text(
            'RESCHEDULE',
            style: TextStyle(color: Colors.white, fontSize: 12),
          )))),
      DataCell(
        Center(
          child: PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewBookingscreen()));
                      },
                      leading: Icon(Icons.remove_red_eye_rounded),
                      title: Text('View'),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.edit_document),
                      title: Text('Edit'),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
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
