import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: Center(
        child: Container(
          color: Colors.teal,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            // textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              CaixaPreta(),
              CaixaPreta(),
              CaixaPreta(
                altura: 120,
                largura: 150,
              ),
              CaixaPreta(),
            ],
          ),
        ),
      ),
    );
  }
}

class CaixaPreta extends StatelessWidget {
  final double altura;
  final double largura;
  CaixaPreta({this.altura, this.largura});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura ?? 60,
      width: largura ?? 60,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.white,
            width: 1,
          )),
    );
  }
}
