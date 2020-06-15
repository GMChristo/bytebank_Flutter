import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/material-library.html - pagina do flutter com os widgets;

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        )
      ),
      home: ListaTransferencias(),
    ); //implementa o uso do Material Design e informa para o MaterialApp que a pagina inicial eh a home;
  }
}