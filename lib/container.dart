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
        title: Text('Container'),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 150,
          color: Colors.green,
        ),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        Container(
          child: Text(
            'filho',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.green,
              gradient: LinearGradient(
                colors: [Colors.blue[100], Colors.blue],
              )),
        ),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.green,
              gradient: RadialGradient(
                colors: [Colors.blue[100], Colors.blue],
              )),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 100,
          child: Text('filho'),
          decoration: BoxDecoration(
              color: Colors.white30,
              // border: Border.all(color: Colors.grey, width: 2),
              // borderRadius: BorderRadius.circular(50),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/tenis.png')),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                    spreadRadius: 1),
              ]),
        )
      ]),
    );
  }
}
