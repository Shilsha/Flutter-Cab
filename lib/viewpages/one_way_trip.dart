// ignore_for_file: unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cab/viewpages/consts.dart';
import 'package:flutter_cab/viewpages/home_screen_1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import "package:google_maps_webservice/places.dart";
import 'package:google_api_headers/google_api_headers.dart';

enum Destination { one_way_trip, round_trip }

class one_way_trip extends StatefulWidget {
  const one_way_trip({super.key});

  @override
  State<one_way_trip> createState() => _one_way_tripState();
}

class _one_way_tripState extends State<one_way_trip> {
  Destination? _destination = Destination.one_way_trip;
  DateTime selectedDate = DateTime.now();

  FocusNode sourceFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();

  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  String sourceLocation = "Source Location";
  String destinationLocation = "Destination Location";

  Future<List<double>?> getCoordinates(String location) async {
    try {
      final places = GoogleMapsPlaces(
        apiKey: GOOGLE_MAP_API_KEY,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );

      List<Location> locations = await places
          .searchByText(location)
          .then((result) => result.results)
          .then((results) => results.map((result) => result.geometry!.location))
          .then((locations) => locations.toList());

      if (locations.isNotEmpty) {
        return [locations.first.lat, locations.first.lng];
      } else {
        return [];
      }
    } catch (e) {
      print("Error getting coordinates: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  title: Text(
                    'Destination',
                    style: GoogleFonts.openSans(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                    title: const Text('One way Trip'),
                    leading: Radio<Destination>(
                        value: Destination.one_way_trip,
                        groupValue: _destination,
                        onChanged: (Destination? value) {
                          setState(() {
                            _destination = value;
                          });
                        }),
                  )),
                  Expanded(
                      child: ListTile(
                    title: const Text('Round Trip'),
                    leading: Radio<Destination>(
                        value: Destination.round_trip,
                        groupValue: _destination,
                        onChanged: (Destination? value) {
                          setState(() {
                            _destination = value;
                          });
                        }),
                  ))
                ],
              ),
              Column(
                children: [
                  ListTile(
                    minVerticalPadding: 0,
                    dense: true,
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                      ),
                      child: const Icon(Icons.radio_button_checked),
                    ),
                    title: GestureDetector(
                        onTap: () async {
                          var sourcePlace = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: GOOGLE_MAP_API_KEY,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              onError: (err) {
                                print(err);
                              });

                          if (sourcePlace != null) {
                            final plist = GoogleMapsPlaces(
                              apiKey: GOOGLE_MAP_API_KEY,
                              apiHeaders: await GoogleApiHeaders().getHeaders(),
                            );
                            String placeid = sourcePlace.placeId ?? "0";
                            final detail =
                                await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;

                            String limitedSourceLocation = sourcePlace
                                            .description !=
                                        null &&
                                    sourcePlace.description!.length > 30
                                ? "${sourcePlace.description!.substring(0, 30)}..."
                                : sourcePlace.description ?? "";

                            setState(() {
                              sourceLocation =
                                  (sourcePlace.description?.length ?? 0) > 30
                                      ? "$limitedSourceLocation..."
                                      : limitedSourceLocation;
                              try {
                                if (sourceLocation != null) {
                                  print(sourceLocation);
                                } else {
                                  print('error here');
                                }
                              } catch (e) {
                                print(e);
                              }
                            });
                          }
                        },
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: ListTile(
                              title: Text(
                                sourceLocation,
                                style: GoogleFonts.openSans(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ))),
                    subtitle: const Divider(),
                    trailing: Transform.translate(
                      offset: Offset(0, 27),
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(234, 232, 232, 1)),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          size: 30,
                        )),
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    dense: true,
                    leading: const Icon(
                      Icons.add_location,
                      size: 30,
                    ),
                    title: GestureDetector(
                        onTap: () async {
                          var destinationPlace = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: GOOGLE_MAP_API_KEY,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              onError: (err) {
                                print(err);
                              });

                          if (destinationPlace != null) {
                            final plist = GoogleMapsPlaces(
                              apiKey: GOOGLE_MAP_API_KEY,
                              apiHeaders: await GoogleApiHeaders().getHeaders(),
                            );
                            String placeid = destinationPlace.placeId ?? "0";
                            final detail =
                                await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;
                            String limitedDestinationLocation = destinationPlace
                                            .description !=
                                        null &&
                                    destinationPlace.description!.length > 30
                                ? "${destinationPlace.description!.substring(0, 30)}..."
                                : destinationPlace.description ?? "";

                            setState(() {
                              destinationLocation =
                                  (destinationPlace.description?.length ?? 0) >
                                          30
                                      ? "$limitedDestinationLocation..."
                                      : limitedDestinationLocation;
                            });
                          }
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: ListTile(
                              title: Text(destinationLocation,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ))),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(right: 18, left: 18, top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Departure Date',
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.4)),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              DateTime? datePicked =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: selectedDate,
                                                      firstDate: DateTime(2024),
                                                      lastDate: DateTime(2030));

                                              if (datePicked != null) {
                                                setState(() {
                                                  selectedDate = datePicked;
                                                });
                                              }
                                            },
                                            child: const Icon(
                                              Icons.calendar_month,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.4),
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            selectedDate != null
                                                ? DateFormat('dd MMMM, yyyy')
                                                    .format(selectedDate)
                                                : 'Select a date',
                                            style: GoogleFonts.openSans(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                children: [
                                  Image.asset(
                                      'assets/images/icons/search-places.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Search Near by Places',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: const Color.fromRGBO(
                                            217, 115, 122, 1)),
                                  )
                                ],
                              ),
                            ),
                            _shoppix_mall(),
                            const Divider(),
                            _shoppix_mall(),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Popular Places',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color:
                                      const Color.fromRGBO(217, 115, 122, 1)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _shoppix_mall(),
                            const Divider(),
                            _shoppix_mall(),
                            const Divider(),
                            _shoppix_mall(),
                            const Divider(),
                            _shoppix_mall(),
                            const Divider(),
                            _shoppix_mall(),
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.heavyImpact();
                              },
                              child: GestureDetector(
                                onTap: () async {
                                  if (sourceLocation.isNotEmpty &&
                                      destinationLocation.isNotEmpty) {
                                    List<double>? sourceCoordinates =
                                        await getCoordinates(sourceLocation);
                                    List<double>? destinationCoordinates =
                                        await getCoordinates(
                                            destinationLocation);
                                    if (sourceCoordinates != null &&
                                        destinationCoordinates != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => home_screen_1(
                                            sourceLocation: sourceLocation,
                                            destinationLocation:
                                                destinationLocation,
                                            sourceCoordinates:
                                                sourceCoordinates,
                                            destinationCoordinates:
                                                destinationCoordinates,
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 35),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(123, 30, 52, 1),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                      child: Text(
                                    'Search',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ]))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  _shoppix_mall() {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      leading: const Icon(
        Icons.add_location,
        size: 30,
      ),
      title: Text(
        'Shoppix Mall',
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        'Surya Place Colony, Meerut,Uttar Pradesh 25...',
        style: GoogleFonts.poppins(
            fontSize: 12, color: const Color.fromRGBO(59, 65, 86, 0.7)),
      ),
      trailing: Container(
        width: 30,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(194, 33, 44, 1), shape: BoxShape.circle),
        child: const Center(
            child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        )),
      ),
    );
  }
}
