import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exemplos/atividade/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}