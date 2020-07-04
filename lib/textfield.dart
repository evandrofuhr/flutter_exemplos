import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exemplos/atividade/main.dart';

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
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: false,
              cursorColor: Colors.red,
              maxLength: 100,
              buildCounter: (context, {currentLength, isFocused, maxLength}) {
                if (isFocused) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('$currentLength/$maxLength'),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(Icons.smoking_rooms),
                    ],
                  );
                } else {
                  return null;
                }
              },
              cursorRadius: Radius.circular(50),
              cursorWidth: 10,
              decoration: InputDecoration(
                labelText: 'valor aqui',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
                counter: null,
                alignLabelWithHint: true,
                hintText: 'digite qualquer coisa',
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabled: true,
                counterText: null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                errorText: null,
                errorMaxLines: 1,
                counterStyle: TextStyle(
                  color: Colors.green,
                ),
                fillColor: Colors.amber,
                filled: false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                helperText: 'Aqui temos um helper legalzin!',
                helperStyle: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                ),
                hoverColor: Colors.blue,
                icon: Icon(
                  Icons.access_time,
                ),
                prefixIcon: null,
                prefix: null,
              ),
              enableSuggestions: false,
              controller: _controller,
              enabled: true,
              focusNode: _focusNode,
              maxLines: 1,
              obscureText: false,
              style: TextStyle(
                color: Colors.deepOrange,
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _focusNode2.requestFocus(),
              onChanged: (_) => print('chanjo'),
              onEditingComplete: () => print('concluiu'),
            ),
            TextField(
              focusNode: _focusNode2,
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () =>
                  _controller.text = 'Teste de entrada programaticamente',
              child: Text('Setar texto!'),
            ),
            RaisedButton(
              onPressed: () => _focusNode.requestFocus(),
              child: Text('Foco !'),
            ),
          ],
        ),
      ),
    );
  }
}
