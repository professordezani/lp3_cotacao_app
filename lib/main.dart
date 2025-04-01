// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var txtReais = TextEditingController();
  var txtDolares = TextEditingController();
  var txtMoeda = TextEditingController();
  var moeda = "USD-BRL";

  void converter () async {

    var url = 'https://economia.awesomeapi.com.br/json/last/$moeda';

    var response = await http.get(Uri.parse(url));

    var dados = json.decode(response.body);

    double cotacao = double.parse(dados[moeda.replaceFirst("-", "")]["ask"]);
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
            DropdownMenu(
              width: MediaQuery.of(context).size.width - 20,
              onSelected: (value) => setState(() => moeda = value!),
              controller: txtMoeda,
              dropdownMenuEntries: [
                DropdownMenuEntry(label: "Dólar", value: "USD-BRL"),
                DropdownMenuEntry(label: "Euro", value: "EUR-BRL"),
                DropdownMenuEntry(label: "Bitcoin", value: "BTC-BRL"),
              ]
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtDolares,
              decoration: InputDecoration(
                labelText: txtMoeda.text,
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