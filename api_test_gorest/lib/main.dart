import 'package:api_test_gorest/data_class.dart';
import 'package:flutter/material.dart';
import 'services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Welcome> _usuarios = List<Welcome>.empty();
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    setState(() {
      Services.getData().then(
        (users) {
          _usuarios = users;
          _loading = false;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        child: ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: null == _usuarios ? 0 : _usuarios.length,
          itemBuilder: (context, index) {
            Welcome usuario = _usuarios[index];
            print(usuario);
            var nambre = usuario.data[index].name.toString();
            print(nambre);
            return ListTile(
              title: Text(usuario.code.toString()),
              subtitle: Text(usuario.data[index].name.toString()),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Services.getData().then(
              (users) {
                _usuarios = users;
                _loading = false;
              },
            );
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
