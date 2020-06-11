import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/material-library.html - pagina do flutter com os widgets;

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          //aplica o widget de Scaffold, um layout;
          body: ListaTransferencias(),
          appBar: AppBar(
            //adiciona um widget de AppBar ao layout ja existente;
            title: Text(
                'Transferências!'), //define o texto que eh mostrado na Appbar;
          ),
          /*floatingActionButton: FloatingActionButton( //adiciona um botao flutuante;
            child: Icon(Icons.add), //child serve para colocar um widget dentro de outro widget;
            //Icons - cria um botao, importando os estilos de Icon, e selecionando qual estilo usar em Icons.add;
          ),*/
        ),
      ), //implementa o uso do Material Design e informa para o MaterialApp que a pagina inicial eh a home;
    );


class ListaTransferencias extends StatelessWidget {//StatelessWidget nao tem a capacidade de alterar o conteudo diferente do StatefulWidget que consegue alterar o conteudo;
 
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[ //para adicionar deixei o cursor no card e apertei alt+enter, selecionei wrap with column que ele adicionou o codigo de column;
              ItemTransferencia(Transferencia(100.0, 0102)),
              ItemTransferencia(Transferencia(200.0, 0103)),
            ],
          );
  } 
}


class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia; // o '_' indica que eh um atributo privado

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(_transferencia.valor.toString()),
                  subtitle: Text(_transferencia.numeroConta.toString()),
                )
              );
  }
  
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}