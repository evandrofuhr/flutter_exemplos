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
  void dispose() {
    super.dispose();
  }

  void _semRetornoAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Há algo errado!',
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Sim',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Não',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: Text(
              'Só mais uma mensagem padrão pro usuário. Clique em sim para confir mar e não não para confirma também, só que negativo!'),
        );
      },
    );
  }

  void _comRetornoAlertDialog() async {
    var acao = await showDialog<ETipoAcao>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Há algo errado!',
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Sim',
              ),
              onPressed: () {
                Navigator.of(context).pop(ETipoAcao.SIM);
              },
            ),
            FlatButton(
              child: Text(
                'Não',
              ),
              onPressed: () {
                Navigator.of(context).pop(ETipoAcao.NAO);
              },
            )
          ],
          content: Text(
              'Só mais uma mensagem padrão pro usuário. Clique em sim para confir mar e não não para confirma também, só que negativo!'),
        );
      },
    );
    if (acao == ETipoAcao.NAO) {
      print('é não');
    } else {
      print('é sim');
    }
  }

  void _semRetornoSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Há algo errado!',
          ),
          children: [
            Text('Só mais uma mensagem padrão pro usuário!'),
            Text('Posso ter mais de um Widget!'),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'SEM RETORNO (AlertDialog)',
              ),
              onPressed: _semRetornoAlertDialog,
            ),
            RaisedButton(
              child: Text(
                'SEM RETORNO (SimpleDialog)',
              ),
              onPressed: _semRetornoSimpleDialog,
            ),
            RaisedButton(
              child: Text(
                'COM RETORNO (AlertDialog)',
              ),
              onPressed: _comRetornoAlertDialog,
            ),
          ],
        ),
      ),
    );
  }
}

enum ETipoAcao { SIM, NAO }
