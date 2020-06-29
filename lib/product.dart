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
  int _quantidade = 1;
  bool _favorito = false;

  void _soma() {
    setState(() {
      _quantidade++;
    });
  }

  void _diminui() {
    setState(() {
      _quantidade--;
    });
  }

  void _fav() {
    setState(() {
      _favorito = !_favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'TÊNIS GEL SENDAI',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      'tênis / masculino',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.chevron_left,
                      size: 49,
                      color: Colors.black54,
                    ),
                    Expanded(
                        child: Container(
                      height: 300,
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/tenis.png')),
                    )),
                    Icon(
                      Icons.chevron_right,
                      size: 49,
                      color: Colors.black54,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.remove_circle,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Detalhes',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'R\$',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                Text(
                                  '129,00',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'O tênis Asics Gel Sendai oferece uma absorção de choque extrema e um macio e perfeito ajuste. Para isso, o modelo conta com um exclusivo sistema de gel.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Features',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Cores',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 30,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 2,
                                      itemBuilder: (b, i) {
                                        if (i == 0) {
                                          return Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 16,
                                              color: Colors.blue,
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              width: 16,
                                              color: Colors.red,
                                            ),
                                          );
                                        }
                                      }),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Quantidade',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 80,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black54, width: 0.5)),
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: _diminui,
                                        child: Icon(
                                          Icons.remove,
                                          size: 11,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        '${_quantidade.toString().padLeft(2, '0')}',
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      )),
                                      GestureDetector(
                                        onTap: _soma,
                                        child: Icon(
                                          Icons.add,
                                          size: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.star, color: Colors.black54),
                                      Icon(Icons.star, color: Colors.black54),
                                      Icon(Icons.star, color: Colors.black54),
                                      Icon(Icons.star, color: Colors.black54),
                                      Icon(
                                        Icons.star,
                                        color: Colors.black26,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: _fav,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: Center(
                                      child: Icon(
                                        _favorito
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                            bottom: BorderSide(
                                                color: Colors.black54,
                                                width: 0.5),
                                            top: BorderSide(
                                                color: Colors.black54,
                                                width: 0.5),
                                            start: BorderSide(
                                                color: Colors.black54,
                                                width: 0.5))),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            'Favorito',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black54,
                                                width: 0.5))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom: BorderSide(
                                            color: Colors.black54, width: 0.5),
                                        top: BorderSide(
                                            color: Colors.black54, width: 0.5),
                                        start: BorderSide(
                                            color: Colors.black54, width: 0.5)),
                                    color: Colors.black54,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          'Add to cart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          border: Border.all(
                                              color: Colors.black54,
                                              width: 0.5))),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
