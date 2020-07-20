import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      height: 100,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "Universitas Esa Unggul",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
