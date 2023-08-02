import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/app/segunda_tela.dart';

import 'home.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key, required this.title});
  final String title;
  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}


class _TerceiraTelaState extends State<TerceiraTela> {
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
    double? value2 = double.tryParse(_number2.text) ?? 0.0;
    setState(() {
      total = (value1 + value2).toString();
    });
  }

  void _sub() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse(_number2.text) ?? 0.0;
    setState(() {
      total = (value1 - value2).toString();
    });
  }

  void _multi() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse(_number2.text) ?? 0.0;
    setState(() {
      total = (value1 * value2).toString();
    });
  }

  void _div() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse(_number2.text) ?? 0.0;
    setState(() {
      total = (value1 / value2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          //teste de comentario
          //padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),

            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: "navegou")),
                );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SegundaTela(title: "212")),
                );
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TerceiraTela(
                      title: "terceiratela")),
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
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                 // iconSize: 20,
                  icon: const Icon(CupertinoIcons.plus_circle_fill),
                  onPressed: () {
                    _somar();
                  },
                ),
                IconButton(
                  // iconSize: 20,
                  icon: const Icon(CupertinoIcons.minus),
                  onPressed: () {
                    _sub();
                  },
                ),

                IconButton(
                  // iconSize: 20,
                  icon: const Icon(CupertinoIcons.multiply_circle_fill),
                  onPressed: () {
                    _multi();
                  },
                ),

                IconButton(
                  // iconSize: 20,
                  icon: const Icon(CupertinoIcons.divide),
                  onPressed: () {
                    _div();
                  },
                ),


              ],
            ),





            Text(
                "Resultado igual à :$total"
            ),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}