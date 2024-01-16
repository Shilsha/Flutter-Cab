import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 233, 226, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 50,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.14))
                ]),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.menu),
                      suffixIcon: Icon(Icons.notifications)),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.2,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/rental_kCab.png',
                          height: 65,
                        ),
                        Text(
                          'Rental',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color.fromRGBO(123, 30, 52, 1)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4.2,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/tour_package_kCab.png',
                          height: 65,
                        ),
                        Text(
                          'Tour Package',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color.fromRGBO(123, 30, 52, 1)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4.2,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/ride_kCab.png',
                      height: 65,
                    ),
                    Text(
                      'Ride',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Color.fromRGBO(123, 30, 52, 1)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
