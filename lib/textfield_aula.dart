import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFormPage(),
      theme: ThemeData(primaryColor: Colors.teal),
    );
  }
}

class TextFormPage extends StatefulWidget {
  @override
  TextFormPageState createState() => TextFormPageState();
}

class TextFormPageState extends State<TextFormPage> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  String nome;
  int idade;

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  modalInformativoDeSucesso() {
    showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Aviso ao salvar'),
          children: <Widget>[
            Text('Salvo com sucesso'),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Formulários'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              controller: nomeController,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Idade',
              ),
              keyboardType: TextInputType.number,
              controller: idadeController,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    nome = nomeController.text;
                    idade = int.tryParse(idadeController.text) ?? 0;
                  });
                  modalInformativoDeSucesso();
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                color: Colors.teal,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              child: Text(
                'Nome: $nome',
                style: TextStyle(fontSize: 18),
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
                'Idade: $idade',
                style: TextStyle(fontSize: 18),
              ),
              alignment: Alignment.centerLeft,
            )
          ],
        ),
      ),
    );
  }
}

class ExemplosInputs extends StatefulWidget {
  @override
  _ExemplosInputsState createState() => _ExemplosInputsState();
}

class _ExemplosInputsState extends State<ExemplosInputs> {
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final profissaoFocus = FocusNode();
  final salarioFocus = FocusNode();
  String apresentacao = '';

  @override
  void dispose() {
    cpfController.dispose();
    emailController.dispose();
    profissaoFocus.dispose();
    salarioFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
                      hintText: 'Digite seu nome',
                    ),
                    onEditingComplete: () {
                      profissaoFocus.requestFocus();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Profissão',
                      hintText: 'Desenvolvedor, engenheiro...',
                      suffixIcon: Icon(Icons.mood),
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) => TextEditingValue(
                          text: newValue.text.toUpperCase(),
                          selection: newValue.selection,
                          composing: newValue.composing,
                        ),
                      )
                    ],
                    focusNode: profissaoFocus,
                    onEditingComplete: () {
                      salarioFocus.requestFocus();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Salário',
                      icon: Icon(Icons.monetization_on),
                      prefix: Text('R\$ '),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.green,
                          width: 5,
                        ),
                        gapPadding: 40,
                      ),
                    ),
                    focusNode: salarioFocus,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu e-mail',
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.blue,
                          width: 5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      hintText: 'CPF',
                      border: OutlineInputBorder(),
                      helperText: 'Digite um CPF válido',
                    ),
                    style: TextStyle(color: Colors.teal),
                    controller: cpfController,
                    inputFormatters: [
                      BlacklistingTextInputFormatter('4'),
                      WhitelistingTextInputFormatter(RegExp('[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.teal,
                    onChanged: (valor) {
                      print(valor);
                    },
                    onEditingComplete: () {
                      print('chamou o onEditiginComplete');
                    },
                    onSubmitted: (valor) {
                      print(valor);
                    },
                    onTap: () {
                      print('clicou');
                    },
                  ),
                  Text(
                    apresentacao,
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                var cpf = cpfController.text;
                var email = emailController.text;
                if (cpf.length != 11 && email.length < 6) {
                  setState(() {
                    apresentacao = 'CPF ou Email inválidos';
                  });
                  return;
                }
                setState(() {
                  apresentacao = 'Tudo certo';
                });
              },
              color: Colors.teal,
              textColor: Colors.white,
              child: Text(
                'Salvar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
