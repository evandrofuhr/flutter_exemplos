import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'nubank.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NuBankPage(),
    );
  }
}
