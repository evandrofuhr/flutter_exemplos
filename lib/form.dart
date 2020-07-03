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
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        actions: <Widget>[
          Builder(builder: (x) {
            return IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_form.currentState.validate()) {
                  Scaffold.of(x).showSnackBar(
                    SnackBar(
                      content: Text('SALVOU DE BOA'),
                    ),
                  );
                }
              },
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Builder(builder: (x) {
            return Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => print('salvou'),
                  // autovalidate: true,
                  validator: (value) {
                    if (value.length > 10 || value.length < 3) {
                      return 'tamanho inválido. O ${value.length} não esta entre 3 e 10';
                    }
                    return null;
                  },
                ),
                RaisedButton.icon(
                  label: Text('Salvar'),
                  icon: Icon(Icons.save),
                  onPressed: () {
                    if (Form.of(x).validate()) {
                      Form.of(x).save();
                      Scaffold.of(x).showSnackBar(
                        SnackBar(
                          content: Text('SALVOU DE BOA'),
                        ),
                      );
                    }
                  },
                ),
                RaisedButton.icon(
                  label: Text('Reset'),
                  icon: Icon(Icons.clear_all),
                  onPressed: () {
                    Form.of(x).reset();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
