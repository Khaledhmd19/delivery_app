import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonSize,
  });

  final String buttonText;
  final Size buttonSize;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GradientElevatedButton(
      iconAlignment: IconAlignment.start,
      onPressed: () {},
      style: GradientElevatedButton.styleFrom(
        fixedSize: buttonSize,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundGradient: LinearGradient(
          colors: [
            Color(0xffFF8D4D),
            Color(0xffF87C47),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.poppins(
          color: Color(0xffffffff),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
