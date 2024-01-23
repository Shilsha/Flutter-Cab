import 'package:flutter/material.dart';
import 'package:flutter_cab/custom_widget/myData.dart';

class RentalPackageScreen extends StatefulWidget {
  const RentalPackageScreen({super.key});

  @override
  State<RentalPackageScreen> createState() => _RentalPackageScreenState();
}

class _RentalPackageScreenState extends State<RentalPackageScreen> {
  final List<String> options = ['Car Type', 'Option 2', 'Option 3'];
  final List<String> options1 = ['Seat', 'Option 2', 'Option 3'];
  final List<String> options2 = ['Fuel Type', 'Option 2', 'Option 3'];

  String selectedOption = 'Car Type';
  String selectedOption1 = 'Seat';
  String selectedOption2 = 'Fuel Type';
  final DataTableSource _data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 233, 226, 1),
      appBar: AppBar(
        title: Text('Rental Package'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: ListView(children: <Widget>[
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 80,
                height: 35,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.filter_alt_outlined),
                    ),
                    Text(
                      'ALL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(123, 30, 52, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(11)))),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                titlePadding: EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                backgroundColor: Colors.white,
                                title: Row(
                                  children: [
                                    Text(
                                      'Add Rental Package',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close_rounded)),
                                    )
                                  ],
                                ),
                                content: SingleChildScrollView(
                                  child: Container(
                                      // height: 350,
                                      child: Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'Rental Name',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'Rental Hours',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'Rental Km',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'KM/Price',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'Min/Fare',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                labelText: 'Base Location',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromRGBO(
                                                      123, 30, 52, 1)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11)))),
                                      onPressed: () {},
                                      child: Text(
                                        'ADD RENTAL PACKAGE',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                      child: Text(
                        'ADD RENTAL PACKAGE',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            // padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width,
                            // height: 250,
                            child: PaginatedDataTable(
                              headingRowColor: MaterialStatePropertyAll(
                                Color.fromRGBO(194, 226, 236, 0.925),
                              ),
                              columns: [
                                DataColumn(label: Text('NAME')),
                                DataColumn(label: Text('HOUR')),
                                DataColumn(label: Text('KM')),
                                DataColumn(label: Text('CREATED DATE')),
                                DataColumn(label: Text('STATUS')),
                                DataColumn(label: Text('Action')),
                              ],
                              source: _data,
                              columnSpacing: 50,
                              horizontalMargin: 40,
                              rowsPerPage: 5,
                              showCheckboxColumn: true,
                            ),
                          ),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
