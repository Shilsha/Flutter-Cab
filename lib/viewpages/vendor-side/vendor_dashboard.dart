import 'package:flutter/material.dart';
import 'package:flutter_cab/custom_widget/barChart_modal.dart';
import 'package:flutter_cab/viewpages/login_screen.dart';
import 'package:flutter_cab/viewpages/vendor-side/add_vehicle_screen.dart';
import 'package:flutter_cab/viewpages/vendor-side/booking_management_screen.dart';
import 'package:flutter_cab/viewpages/vendor-side/profile_screen.dart';
import 'package:flutter_cab/viewpages/vendor-side/rental_management_screen.dart';
import 'package:flutter_cab/viewpages/vendor-side/rental_package_screen.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VendorDashboardScreen extends StatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  State<VendorDashboardScreen> createState() => _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends State<VendorDashboardScreen> {
  final List<BarChartModal> data = [
    BarChartModal(
      rentalName: 'TOTAL',
      rentaData: 10,
      color: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    BarChartModal(
      rentalName: 'BOOKED',
      rentaData: 5,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModal(
      rentalName: 'RESCHEDULED',
      rentaData: 4,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModal(
      rentalName: 'UP_COMMING',
      rentaData: 0,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModal(
      rentalName: 'UP_GOING',
      rentaData: 1,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModal(
      rentalName: 'CANCELLED',
      rentaData: 3,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    )
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModal, String>> series = [
      charts.Series(
        id: 'rentalData',
        data: data,
        domainFn: (BarChartModal series, _) => series.rentalName,
        measureFn: (BarChartModal series, _) => series.rentaData,
        colorFn: (BarChartModal series, _) => series.color,
      ),
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 233, 226, 1),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
        // backgroundColor: Color.fromRGBO(234, 233, 226, 1),
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black87)),
                    filled: true,
                    fillColor: Colors.white70,
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            child: IconButton(
              icon: CircleAvatar(
                child: Image.asset('assets/images/driver.webp'),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VendorProfileScreen()));
              },
            ),
          )
        ],
      ),

      // backgroundColor: Color.fromRGBO(234, 233, 226, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Container(
                      height: 150,
                      width: 260,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 10, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicles',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Table(columnWidths: {
                                  0: FixedColumnWidth(90),
                                  1: FixedColumnWidth(40)
                                }, children: [
                                  TableRow(children: [
                                    Text(
                                      'Total',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Available',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Booked',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ])
                                ]),
                                Container(
                                  child: Image.asset(
                                    'assets/images/vehicle.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Container(
                      height: 150,
                      width: 260,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 10, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicles',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Table(columnWidths: {
                                  0: FixedColumnWidth(90),
                                  1: FixedColumnWidth(40)
                                }, children: [
                                  TableRow(children: [
                                    Text(
                                      'Total',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Available',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Booked',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ])
                                ]),
                                Container(
                                  child: Image.asset(
                                    'assets/images/vehicle.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Container(
                      height: 150,
                      width: 260,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 10, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicles',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Table(columnWidths: {
                                  0: FixedColumnWidth(90),
                                  1: FixedColumnWidth(40)
                                }, children: [
                                  TableRow(children: [
                                    Text(
                                      'Total',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Available',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Booked',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                    Text(
                                      '3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    )
                                  ])
                                ]),
                                Container(
                                  child: Image.asset(
                                    'assets/images/vehicle.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(123, 30, 52, 1),
                            blurRadius: 1,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ]),
                    // color: Color.fromRGBO(234, 233, 226, 1),
                    width: 260,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 5, top: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicles',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Table(
                                    defaultColumnWidth: FixedColumnWidth(65.0),
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'Total',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '4',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Available',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Booked',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/images/vehicle.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(123, 30, 52, 1),
                            blurRadius: 1,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ]),
                    width: 260,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 5, top: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Driver',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Table(
                                    // defaultColumnWidth: FixedColumnWidth(65.0),
                                    columnWidths: {
                                      0: FixedColumnWidth(90.0),
                                      1: FixedColumnWidth(40)
                                    },
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'Total',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '4',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Available',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Not-Available',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/driver.webp',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(123, 30, 52, 1),
                            blurRadius: 1,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ]),
                    // color: Color.fromRGBO(234, 233, 226, 1),
                    width: 260,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 5, top: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Booking',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(123, 30, 52, 1)),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Table(
                                    // defaultColumnWidth: FixedColumnWidth(65.0),
                                    columnWidths: {
                                      0: FixedColumnWidth(90.0),
                                      1: FixedColumnWidth(50)
                                    },
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'Total',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '4',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Rescheduled',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Cancelled',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        ),
                                        Text(
                                          '3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5)),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/images/vehicle.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(123, 30, 52, 1),
                      blurRadius: 1,
                      offset: Offset(1, 1), // Shadow position
                    ),
                  ]),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Rental booking chart',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(123, 30, 52, 1)),
                  ),
                ),
                // Container(width: 320, height: 220, child: chartToRun()),
                // chartToRun(),

                // )

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: 360,
                    height: 240,
                    child: charts.BarChart(
                      domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec<String>(
                          labelRotation: 60,
                          labelStyle: charts.TextStyleSpec(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      series,
                      animate: true,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(123, 30, 52, 1),
                      blurRadius: 2,
                      offset: Offset(1, 1), // Shadow position
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                    child: Text(
                      'Booking history',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(123, 30, 52, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        border: TableBorder(
                          horizontalInside: BorderSide(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: {
                          0: FixedColumnWidth(240),
                          1: FixedColumnWidth(130),
                          2: FixedColumnWidth(150),
                          3: FixedColumnWidth(120),
                          4: FixedColumnWidth(90),
                          5: FixedColumnWidth(70),
                          6: FixedColumnWidth(100),
                          7: FixedColumnWidth(130),
                          8: FixedColumnWidth(120),
                          9: FixedColumnWidth(80),
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(194, 226, 236, 0.925),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              children: [
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      'USER NAME',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'PACKAGE NAME',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'PICK-UP LOCATION',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'START TIME',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'CAR TYPE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'SEAT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'FUEL TYPE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'CREATED DATE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'STATUS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'ACTION',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                              ]),
                          TableRow(children: [
                            Center(
                              child: ListTile(
                                // contentPadding: EdgeInsets.only(right: 40),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(241, 241, 237, 0.933),
                                  child:
                                      Image.asset('assets/images/driver.webp'),
                                ),
                                title: Text('Ramkewal'),
                                subtitle: Text('ram@gmail.com'),
                              ),
                            ),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('Noida ,utter pradesh')),
                            Center(child: Text('4:03')),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('4')),
                            Center(child: Text('Diesel')),
                            Center(child: Text('04-01-2024')),
                            Center(
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                                child: Center(
                                  child: Text(
                                    'BOOKED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
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
                          ]),
                          TableRow(children: [
                            Center(
                              child: ListTile(
                                // contentPadding: EdgeInsets.only(right: 40),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(241, 241, 237, 0.933),
                                  child:
                                      Image.asset('assets/images/driver.webp'),
                                ),
                                title: Text('Ramkewal'),
                                subtitle: Text('ramkewal143@gmail.com'),
                              ),
                            ),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('Noida Utter pradesh')),
                            Center(child: Text('Diesel')),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('4')),
                            Center(child: Text('Diesel')),
                            Center(child: Text('SEDAN')),
                            Center(
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                                child: Center(
                                  child: Text(
                                    'BOOKED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
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
                          ]),
                          TableRow(children: [
                            Center(
                              child: ListTile(
                                // contentPadding: EdgeInsets.only(right: 40),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(241, 241, 237, 0.933),
                                  child:
                                      Image.asset('assets/images/driver.webp'),
                                ),
                                title: Text('Ramkewal'),
                                subtitle: Text('ram@gmail.com'),
                              ),
                            ),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('Noida utter pradesh')),
                            Center(child: Text('Diesel')),
                            Center(child: Text('SEDAN')),
                            Center(child: Text('4')),
                            Center(child: Text('Diesel')),
                            Center(child: Text('SEDAN')),
                            Center(
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                                child: Center(
                                  child: Text(
                                    'BOOKED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
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
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(123, 30, 52, 1),
                        blurRadius: 2,
                        offset: Offset(1, 1), // Shadow position
                      ),
                    ]),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                        // width: MediaQuery.of(context).size.width,
                        ),
                  ),
                )),
          ]),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Color.fromRGBO(234, 233, 226, 1),
        width: 290.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 15),
                child: Image.asset(
                  'assets/images/Asset 233000 1.png',
                ),
              ),
              // Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/driver.webp'),
                ),
                title: Text(
                  'Vendor',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(69, 30, 243, 1)),
                ),
                subtitle: Text(
                  'vendor@gmail.com',
                  style: GoogleFonts.openSans(),
                ),
              ),
              Divider(),
              ListTile(
                splashColor: Colors.white,
                leading: Icon(
                  Icons.dashboard,
                  color: Color.fromRGBO(129, 0, 30, 1),
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Color.fromRGBO(129, 0, 30, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                splashColor: Colors.white,
                leading: Icon(
                  Icons.car_rental,
                ),
                title: Text(
                  'Rental Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          RentalManagementScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.archive,
                ),
                title: Text(
                  'Rental Package',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          RentalPackageScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book_online,
                ),
                title: Text(
                  'Booking Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingManagementScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.car_crash,
                ),
                title: Text(
                  'Add Vehicle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddVehicleScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.card_travel_sharp,
                ),
                title: Text(
                  'Cab Allocate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_activity,
                ),
                title: Text(
                  'Activities Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.payments_rounded,
                ),
                title: Text(
                  'Package Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.inventory,
                ),
                title: Text(
                  'Vehicle Inventory',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.drive_eta_rounded,
                ),
                title: Text(
                  'Driver Management',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 100, top: 20),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout,
                            color: const Color.fromRGBO(69, 30, 243, 1)),
                        Text(
                          'Logout',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(69, 30, 243, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
