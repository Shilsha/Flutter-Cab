// import 'dart:async';
// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class home_screen_1 extends StatefulWidget {
  const home_screen_1({super.key});

  @override
  State<home_screen_1> createState() => _home_screen_1State();
}

class _home_screen_1State extends State<home_screen_1> {
  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.infinity,
                  child:
                      // GoogleMap(
                      //   initialCameraPosition: _kGooglePlex,
                      // )
                      Image.asset(
                    'assets/images/home_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          offset: Offset(0, 4),
                          color: Color.fromRGBO(0, 0, 0, 0.14))
                    ]),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5)),
                          prefixIcon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                          suffixIcon: const Icon(Icons.notifications)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Select Your Location',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(104, 104, 104, 1)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              height: 65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 22,
                        offset: Offset(0, 4),
                        color: Color.fromRGBO(0, 0, 0, 0.14))
                  ]),
              child: Center(
                child: ListTile(
                  leading: Image.asset('assets/images/icons/dot.png'),
                  title: Text(
                    'Current Location',
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 0, 0, 0.7)),
                  ),
                ),
              ),
            ),
            Text(
              'Enter Location Manually',
              style: GoogleFonts.openSans(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: const Color.fromRGBO(48, 9, 231, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: const Color.fromRGBO(48, 9, 231, 1)),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        )),
      ),
    );
  }
}
