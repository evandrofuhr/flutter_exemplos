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
        title: Text('Buttom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('FLAT BUTTON'),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Flat Buttom',
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 8,
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.insert_emoticon,
                  ),
                  label: Text(
                    'Flat Buttom Icon',
                  ),
                )
              ],
            ),
            Text('RAISED BUTTON'),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Raised Buttom',
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 8,
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.insert_emoticon,
                  ),
                  label: Text(
                    'Raised Buttom Icon',
                  ),
                )
              ],
            ),
            Text('ICON BUTTON'),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.accessibility),
                  onPressed: () {},
                  iconSize: 32,
                ),
                SizedBox(
                  width: 8,
                ),
                BackButton(
                  onPressed: () {},
                ),
                SizedBox(
                  width: 8,
                ),
                CloseButton(
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
