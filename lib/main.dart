import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var txtReais = TextEditingController();
  var txtDolares = TextEditingController();

  void converter () async {

    var url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';

    var response = await http.get(Uri.parse(url));

    var dados = json.decode(response.body);

    double cotacao = double.parse(dados["USDBRL"]["ask"]);
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