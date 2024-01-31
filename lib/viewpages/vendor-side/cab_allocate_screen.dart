import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cab/custom_widget/cab_allocate_data.dart';

class CabAllocateScreen extends StatefulWidget {
  const CabAllocateScreen({super.key});

  @override
  State<CabAllocateScreen> createState() => _CabAllocateScreenState();
}

class _CabAllocateScreenState extends State<CabAllocateScreen> {
  final DataTableSource data = CabAllopcateData();

  TextEditingController _searchData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(234, 233, 226, 1),
          appBar: AppBar(
            title: Text('Cab Allocate'),
            bottom: TabBar(indicatorColor: Colors.red, tabs: [
              Tab(child: Text('Package Booked')),
              Tab(
                child: Text('Allocated Cabs'),
              )
            ]),
          ),
          body: TabBarView(children: [
            Container(
              child: Text('data'),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child: ListView(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Form(
                            child: TextFormField(
                              controller: _searchData,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(Icons.search),
                                hintText: 'Search',
                              ),
                              onChanged: (String _searchData) {
                                setState(() {
                                  _searchData = _searchData;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: [
                            'Today',
                            'Tomorrow',
                            'Up Comming 3 Days',
                            'Last 3 Days',
                            'This Week',
                            'Last Week',
                            'This Month',
                            'Last Month'
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.filter_alt_outlined),
                              filled: true,
                              fillColor: Colors.white,
                              // labelText: "Select Doors",
                              hintText: "Filter",
                            ),
                          ),
                          onChanged: print,
                          // selectedItem: "Brazil",
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
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 250,
                                child: PaginatedDataTable(
                                  dataRowMaxHeight: 70.0,
                                  headingRowColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(194, 226, 236, 0.925),
                                  ),
                                  columns: [
                                    DataColumn(
                                        label: Container(
                                            // padding: EdgeInsets.only(left: 40),
                                            child: Text('CREATED DATE'))),
                                    DataColumn(
                                        label: Container(
                                            padding: EdgeInsets.only(left: 40),
                                            child: Text('USER NAME'))),
                                    DataColumn(label: Text('PACKAGE NAME')),
                                    DataColumn(label: Text('PACKAGE START')),
                                    DataColumn(label: Text('PACKAGE END')),
                                    DataColumn(label: Text('PICK-UP LOCATION')),
                                    DataColumn(
                                        label: Text('PROP-OFF LOCATION')),
                                    DataColumn(label: Text('STATUS')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  source: data,
                                  columnSpacing: 20,
                                  horizontalMargin: 30,
                                  rowsPerPage: 10,
                                  showCheckboxColumn: true,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ])),
              ),
            )
          ]),
        ));
  }
}
