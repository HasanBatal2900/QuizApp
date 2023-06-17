import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/ThemeData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.switchScreen});
  final void Function() switchScreen;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeingData>(builder: (context, theme, child) {
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                log("pressed");
              },
              style: TextButton.styleFrom(
                animationDuration: const Duration(milliseconds: 600),
                backgroundColor: Colors.transparent,
              ),
              child: const Icon(
                Icons.light,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              "assests/images/quiz-logo.png",
              color: theme.lightTheme.buttonTheme.colorScheme!.onPrimary,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              "Learn Flutter by the fun way!",
              style: GoogleFonts.andika(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  elevation: 1.0, backgroundColor: Colors.indigoAccent),
              onPressed: widget.switchScreen,
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              label: Text(
                "Start Quiz",
                style: GoogleFonts.andika(
                  fontWeight: FontWeight.bold,
                  color: theme.lightTheme.buttonTheme.colorScheme!.primary,
                ),
              ))
        ]),
      );
    });
  }
}
