import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:uas/ui_jawaban/nomor_dua_tiga.dart';
import 'package:uas/ui_jawaban/nomor_satu.dart';

class SoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 20,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "REST API",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NomorSatu(),
                      ),
                    );
                  },
                  child: Icon(Icons.navigate_next),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 20,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Multi Provider & BLoC State Management ",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NomorDua(),
                      ),
                    );
                  },
                  child: Icon(Icons.navigate_next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
