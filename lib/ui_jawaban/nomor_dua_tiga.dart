import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uas/logic_jawaban.dart/jawaban_dua.dart';
import 'package:uas/logic_jawaban.dart/jawaban_tiga.dart';

class NomorDua extends StatefulWidget {
  @override
  _NomorDuaState createState() => _NomorDuaState();
}

class _NomorDuaState extends State<NomorDua> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Money>(
          create: (context) => Money(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              StreamBuilder(
                initialData: Colors.white,
                stream: bloc.stateStream,
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 50,
                          top: 50,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.navigate_before,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 50,
                        ),
                        child: Text(
                          "JoStoree",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 30),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 50,
                              top: 30,
                              right: 30,
                            ),
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(3, 4),
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: 50,
                                  top: 30,
                                  right: 30,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/1.png"),
                                  ),
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 150,
                                width: 130,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Water\nMelon",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Rp. 500",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Consumer<Cart>(
                                  builder: (context, cart, _) => Text(
                                    cart.quantity.toString(),
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Consumer<Cart>(
                                      builder: (context, cart, _) =>
                                          Consumer<Money>(
                                        builder: (context, money, _) =>
                                            GestureDetector(
                                          onTap: () {
                                            if (money.balance >= 500) {
                                              cart.quantity += 1;
                                              money.balance -= 500;
                                            }
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Consumer<Cart>(
                                    builder: (context, cart, _) =>
                                        Consumer<Money>(
                                      builder: (context, money, _) =>
                                          GestureDetector(
                                        onTap: () {
                                          if (money.balance < 10000) {
                                            cart.quantity -= 1;
                                            money.balance += 500;
                                          }
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 30,
                              ),
                              width: 250,
                              height: 200,
                              decoration: BoxDecoration(
                                color: snapshot.data,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(3, 4),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "Balance",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: Colors.pink[300],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Consumer<Money>(
                                          builder: (context, money, _) => Text(
                                            money.balance.toString(),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.pink[300],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "Total",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: Colors.pink[300],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Consumer<Cart>(
                                          builder: (context, cart, _) => Text(
                                            (500 * cart.quantity).toString(),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.pink[300],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        FloatingActionButton(
                                          heroTag: "1",
                                          backgroundColor: Colors.white,
                                          onPressed: () {
                                            bloc.eventSink
                                                .add(ColorEvent.to_white);
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: "2",
                                          backgroundColor: Colors.black,
                                          onPressed: () {
                                            bloc.eventSink
                                                .add(ColorEvent.to_black);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
