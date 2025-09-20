import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("About jude Belingham",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
          )),
      backgroundColor: Colors.lightBlueAccent,
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      "https://ichef.bbci.co.uk/ace/standard/2560/cpsprodpb/84b7/live/204b6d80-2063-11ef-baa7-25d483663b8e.jpg",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("His achievement",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Belingham has won CHL,  Laliga 36, FIFA Clubs World Cup 6, Chempionlar Ligasi 15")
                ],
              ),
            ),
            elevation: 12.0,
            shadowColor: Colors.blueAccent,
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("His Top Teammates",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Mbape.Vinijr,Valverde,TAA,Arda,Alaba,Curtua,Husen ")
                ],
              ),
            ),
            elevation: 12.0,
            shadowColor: Colors.blueAccent,
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("About him",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Phil Belingham is an English footballer who plays as a RW and attacking midfielder.")
                ],
              ),
            ),
            elevation: 12.0,
            shadowColor: Colors.blueAccent,
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("His Career",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("A product of Rel Madrit's academy, he debuted in 2017, winning the FIFA U-17 World Cup Golden")
                ],
              ),
            ),
            elevation: 12.0,
            shadowColor: Colors.blueAccent,
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Jude Belingham, Rel Madrit",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  )
));
