import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/ThemeData.dart';

class CustomElavatedBtn extends StatelessWidget {
  const CustomElavatedBtn(
      {super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeingData>(
      builder: (context, theme, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 340,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                textStyle: theme.lightTheme.textTheme.bodyMedium,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 127, 90, 228),
                        strokeAlign: 4)),
                backgroundColor:
                    theme.lightTheme.buttonTheme.colorScheme!.background,
              ),
              onPressed: onTap,
              child: Text(
                answer,
                style: theme.lightTheme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )),
        );
      },
    );
  }
}
