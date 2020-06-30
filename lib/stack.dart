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
        title: Text('Stack'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.amber,
          child: Stack(
            fit: StackFit.passthrough,
            //overflow: Overflow.clip,
            children: <Widget>[
              Container(
                width: 150,
                height: 180,
                color: Colors.red,
              ),
              Container(
                width: 120,
                height: 120,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Text(
                  'posicionado',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
