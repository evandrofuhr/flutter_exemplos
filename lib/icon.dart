import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int _stars = 0;
  void _star(int numero) {
    setState(() {
      if (_stars == numero) {
        _stars--;
      } else {
        _stars = numero;
      }
    });
  }

  Widget _icon(int numero) {
    var clicado = _stars >= numero;
    return InkWell(
      child: Icon(
        clicado ? Icons.star : Icons.star_border,
        color: clicado ? Colors.red : Colors.grey,
      ),
      onTap: () => _star(numero),
    );
  }

  IconData _reaction() {
    switch (_stars) {
      case 1:
        return FontAwesomeIcons.angry;
      case 2:
        return FontAwesomeIcons.frown;
      case 3:
        return FontAwesomeIcons.meh;
      case 4:
        return FontAwesomeIcons.smile;
      case 5:
        return FontAwesomeIcons.grinHearts;
    }
    return FontAwesomeIcons.questionCircle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 60,
              width: 200,
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'clique aqui!',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _icon(1),
                  _icon(2),
                  _icon(3),
                  _icon(4),
                  _icon(5),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              _stars > 0
                  ? Text('você avaliou em $_stars estrelas')
                  : Container(),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          FaIcon(
            _reaction(),
            size: 50,
          ),
        ],
      ),
    );
  }
}
