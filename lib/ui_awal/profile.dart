import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 100,
          width: 100,
          child: Image.asset("assets/foto.png"),
        ),
        Text(
          "Programmer",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
