
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/app/segunda_tela.dart';
import 'package:primeiro_projeto/app/terceira_tela.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _number1 = TextEditingController();
  final _number2 = TextEditingController();
  String total = "0";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _somar() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse( _number2.text) ?? 0.0;
    setState(() {
      total =  (value1 + value2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Cabeçaio'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "navegou")),
                );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SegundaTela(title: "212")),
                );
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TerceiraTela(title: "terceiratela")),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              // style: TextStyle(fontSize: 18, color: Colors.red),
              controller: _number1,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey), //<-- SEE HERE
                ),
                hintText: "Number 1",
                icon: Icon(Icons.numbers, color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              // style: TextStyle(fontSize: 18, color: Colors.red),
              controller: _number2,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey),
                ),
                hintText: "Number 2",
                icon: Icon(Icons.numbers, color: Colors.grey),
              ),
              keyboardType: TextInputType.number,

            ),
            TextButton(
              onPressed: () {
                _somar();
              },
              child: const Text(
                'Somar',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0),
              ),
            ),
            Text(
                "Valor da soma é $total"
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}