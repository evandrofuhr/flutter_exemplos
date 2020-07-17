import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tipo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                  child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _tipo = 0;
                  });
                },
                child: Text('ListView'),
              )),
              Flexible(
                  child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _tipo = 1;
                  });
                },
                child: Text('ListView.builder'),
              )),
              Flexible(
                  child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _tipo = 2;
                  });
                },
                child: Text('ListView.separated'),
              )),
            ],
          ),
          Expanded(child: _main()),
        ],
      ),
    );
  }

  Widget _main() {
    switch (_tipo) {
      case 0:
        return _default();
      case 1:
        return _builder();
      case 2:
        return _separated();
      default:
        return _default();
    }
  }

  Widget _default() {
    return ListView(
      children: <Widget>[
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        RandomColoredBox(),
        ListTile(
          contentPadding: EdgeInsets.all(8), // padding interno
          enabled: true, // habilitado ou não
          onLongPress: () {}, // callback para pressionar por um tempo maior
          onTap: () {}, // callback de pressionar
          selected: true, // dá o aspcto de seleção
          isThreeLine: true, // habilita ou não a terceira linha
          leading: Icon(Icons.person), // Widget que fica a frente do tile
          dense: false, // quando true reduz o tile verticalmente
          title: Text('Title'), // titulo, tem maior enfase
          subtitle: Text('Subtitulo'), // subtitulo, tem menor enfase
          trailing: Icon(Icons.menu), // Widget que fica no fim do tile
        ),
        ListTile(
          contentPadding: EdgeInsets.all(8),
          enabled: false,
          isThreeLine: true,
          leading: Icon(
            Icons.person,
          ),
          dense: false,
          title: Text('Item padrao'),
          subtitle: Text(
            'Aqui mais um texto padrao para teste das 3 linhas. Sera que funciona? acho que nao funciona, vou tentar colocar mais algumas palavras',
            maxLines: 2,
          ),
          trailing: Icon(Icons.menu),
        )
      ],
    );
  }

  Widget _builder() {
    return ListView.builder(
      itemCount: 100,
      reverse: true,
      addAutomaticKeepAlives: true,
      itemBuilder: (context, index) => RandomColoredBox(item: index),
    );
  }

  Widget _separated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) => RandomColoredBox(item: index),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

class RandomColoredBox extends StatefulWidget {
  final int item;
  RandomColoredBox({this.item});

  @override
  _RandomColoredBoxState createState() => _RandomColoredBoxState();
}

class _RandomColoredBoxState extends State<RandomColoredBox> {
  @override
  void initState() {
    super.initState();
    print('initState ${widget.item ?? -1}');
  }

  @override
  void dispose() {
    print('dispose ${widget.item ?? -1}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _random = widget.item;
    if (_random == null || _random > Colors.primaries.length - 1) {
      _random = Random.secure().nextInt(Colors.primaries.length);
    }
    return Container(
      margin: EdgeInsets.only(
        bottom: 8,
      ),
      child: ColoredBox(
        color: Colors.primaries.elementAt(_random),
        child: Container(
          child: Text('Random color ${widget.item ?? _random}'),
          height: 60,
        ),
      ),
    );
  }
}
