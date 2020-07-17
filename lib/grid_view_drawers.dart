import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/grid': (context) => GridPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open Drawer'),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('evandrofuhr@gmail.com'),
            accountName: Text('Evandro Führ'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/123?d=robohash',
              ),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.gravatar.com/avatar/124?d=robohash',
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.gravatar.com/avatar/125?d=robohash',
                ),
              )
            ],
            onDetailsPressed: () => print('details'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('grid'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/grid');
            },
          )
        ],
      ),
    );
  }
}

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  List<String> _urls = [
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/cruze-premier.png?imwidth=960',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/cruze-sport6-premier.png?imwidth=960',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/master/portuguese/index/cars/2018-cruze-sport6/colorizer/01-images/novo-cruze-sport6-2018-azul-petroleo-mov-intro-03.png?imwidth=960',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/2020-cruze-sport6/colorizer/darkmoon%20blue.jpg?imwidth=960',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/master/portuguese/index/cars/2018-cruze-sport6/colorizer/01-images/novo-cruze-sport6-2018-branco-abalone-mov-intro-04.png?imwidth=960',
    'https://production.autoforce.com/uploads/version/profile_image/4103/model_main_comprar-ii_79338fa624.png',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/01-images/onix-plus-premier.jpg?imwidth=960',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTESgJz-hc6_Bkrd1I0_jspbKL_aPuLiLHOoQ&usqp=CAU',
    'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/2020-cruze-premier/mov/04-images/novo-cruze-2020-marrom-capuccino-mov-intro-01.png?imwidth=960',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Grid'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _urls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 9,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetalhePage(index: index, url: _urls[index]),
                ));
              },
              child: Hero(
                tag: 'carro_image$index',
                child: FadeInImage(
                  image: NetworkImage(_urls[index]),
                  placeholder: AssetImage('assets/200.gif'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetalhePage extends StatefulWidget {
  final int _index;
  final String _url;

  DetalhePage({@required int index, @required String url})
      : _index = index,
        _url = url;

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe'),
        centerTitle: true,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Hero(
            tag: 'carro_image${widget._index}',
            child: FadeInImage(
              image: NetworkImage(widget._url),
              placeholder: AssetImage('assets/200.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
