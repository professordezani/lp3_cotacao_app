import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var txtReais = TextEditingController();
  var txtDolares = TextEditingController();

  void converter () {
    double cotacao = 5.71;
    double reais = double.parse(txtReais.text);
    double dolares = reais / cotacao;
    txtDolares.text = dolares.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtReais,
              decoration: InputDecoration(
                labelText: "Reais",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtDolares,
              decoration: InputDecoration(
                labelText: "Dólar",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: converter,
              child: Text("Converter"),
            )
          ],
        ),
      ),
      ),
    );
  }
}