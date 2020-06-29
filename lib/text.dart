import 'package:flutter/gestures.dart';
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
  TapGestureRecognizer _tapGestureRecognizer;

  void _onTap() {
    print('teste');
  }

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer..onTap = _onTap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Column(
        children: <Widget>[
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              maxLines: 5,
              overflow: TextOverflow.fade),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          Text.rich(
            TextSpan(
              text: 'Temos o padrão, ',
              children: <TextSpan>[
                TextSpan(
                    text: 'itálico, ',
                    style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(
                    text: 'negrito (clicável), ',
                    recognizer: _tapGestureRecognizer,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'e com tamanho diferente',
                          style: TextStyle(fontSize: 24))
                    ]),
                TextSpan(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              ],
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
        ],
      ),
    );
  }
}
