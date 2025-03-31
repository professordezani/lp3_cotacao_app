import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: "Reais",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Dólar",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){}, child: Text("Converter"))
          ],
        ),
      ),
      ),
    );
  }
}