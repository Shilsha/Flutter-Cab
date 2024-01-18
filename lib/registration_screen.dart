// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cab/viewpages/login_screen.dart';
// import 'package:flutter_cab/home_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class registration_screen extends StatefulWidget {
  const registration_screen({super.key});

  @override
  State<registration_screen> createState() => _registration_screenState();
}

class _registration_screenState extends State<registration_screen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? validateName(String? name) {
      return name!.isEmpty ? 'Name is required' : null;
    }

    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter Valid Email Address'
          : null;
    }

    String? validatePassword(String? password) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

      return password!.isEmpty || !regex.hasMatch(password)
          ? 'Password is Required'
          : null;
    }

    String? validateConfirmPassword(String? confirmPassword) {
      if (confirmPassword!.isEmpty) {
        return 'Confirm Password is Required';
      }
      if (confirmPassword != passwordController.text) {
        return 'Password do not Match';
      }
      return null;
    }

    return Scaffold(
        backgroundColor: const Color.fromRGBO(234, 233, 226, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(child: Image.asset('assets/images/kCb-logo.png')),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Sign Up',
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(
                      'Create Your Account.',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Color.fromRGBO(0, 0, 0, 0.5)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: validateName,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'Enter Your Name',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              color: const Color.fromRGBO(0, 0, 0, 0.5)),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: validateEmail,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'Email@gmail.com',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              color: const Color.fromRGBO(0, 0, 0, 0.5)),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'Enter Your Password',
                        hintStyle: GoogleFonts.openSans(
                            fontSize: 14,
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        fillColor: Color.fromRGBO(255, 255, 255, 1),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Confirm Password',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: validateConfirmPassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'Enter Your Password Again',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              color: const Color.fromRGBO(0, 0, 0, 0.5)),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        final isValidate = formKey.currentState!.validate();
                        if (isValidate) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(123, 30, 52, 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          'SIGN UP',
                          style: GoogleFonts.openSans(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            ' Login',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(69, 30, 243, 1)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
