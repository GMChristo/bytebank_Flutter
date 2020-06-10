import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/material-library.html - pagina do flutter com os widgets

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          //aplica o widget de Scaffold, um layout;
          appBar: AppBar(
            //adiciona um widget de AppBar ao layout ja existente;
            title: Text(
                'Transferências!'), //define o texto que eh mostrado na Appbar
          ),
          floatingActionButton: FloatingActionButton( //adiciona um botao flutuante
            child: Icon(Icons.add), //define o estilo do botao, importando os estilos de Icon, e selecionando a qual usar em Icons.add
          ),
        ),
      ), //implementa o uso do Material Design e informa para o MaterialApp que a pagina inicial eh a home;
    );
