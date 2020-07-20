import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/ui_soal/soal_page.dart';

class Soal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfff9ed69),
                    Color(0xfff08a5d),
                    Color(0xffb83b5e),
                    Color(0xff6a2c70),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 35,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.navigate_before,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 55,
                      left: 35,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Jordy Dave",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 250,
                  ),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Soal",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SoalPage(),
                    ],
                  ),
                ),
                Container(
                  height: 198,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
