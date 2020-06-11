import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/material-library.html - pagina do flutter com os widgets;

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //aplica o widget de Scaffold, um layout;
        body: FormularioTransferencia(),
      ),
    ); //implementa o uso do Material Design e informa para o MaterialApp que a pagina inicial eh a home;
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferencia'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                  16.0), //padding cria o espaço entre os widgets, o .all aplica a toda a borda padding o msm valor
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(
                    fontSize:
                        24.0 //define o tamanho da fonte que informa o nome do campo
                    ),
                decoration: InputDecoration(
                    labelText: 'Número da conta', //apresenta o nome do campo
                    hintText:
                        '0000' //mostra uma dica quando o campo eh selecionado
                    ),
                keyboardType: TextInputType
                    .number, //define o tipo de teclado que sera mostrado ao selecionar o campo, nesse caso teclado numerico
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  16.0), //padding cria o espaço entre os widgets, o .all aplica a toda a borda padding o msm valor
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(
                    fontSize:
                        24.0 //define o tamanho da fonte que informa o nome do campo
                    ),
                decoration: InputDecoration(
                    labelText: 'Valor', //apresenta o nome do campo
                    hintText:
                        '0,00' //mostra uma dica quando o campo eh selecionado
                    ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                debugPrint(
                    'Clicou no confirmar'); //debugPrint serve para apresentar msg no console, igual printf
                final int numeroConta = int.tryParse(_controladorCampoNumeroConta
                    .text); //cria variavel para receber o num da conta, o parse converte ela de text para int
                final double valor =
                    double.tryParse(_controladorCampoValor.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint(
                      '$transferenciaCriada'); //o '$transferenciaCriada' vai imprimir o valor da variavel
                  Scaffold.of(context).showSnackBar( //implementa SnackBar, serve para apresentar uma pequena barra de msg na tela do celular
                    SnackBar(
                      content: Text('$transferenciaCriada'),
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}

class ListaTransferencias extends StatelessWidget {
  //StatelessWidget nao tem a capacidade de alterar o conteudo diferente do StatefulWidget que consegue alterar o conteudo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //adiciona um widget de AppBar ao layout ja existente;
        title:
            Text('Transferências!'), //define o texto que eh mostrado na Appbar;
      ),
      body: Column(
        children: <Widget>[
          //para adicionar deixei o cursor no card e apertei alt+enter, selecionei wrap with column que ele adicionou o codigo de column;
          ItemTransferencia(Transferencia(100.0, 0102)),
          ItemTransferencia(Transferencia(200.0, 0103)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //adiciona um botao flutuante;
        child: Icon(Icons
            .add), //child serve para colocar um widget dentro de outro widget;
        //Icons - cria um botao, importando os estilos de Icon, e selecionando qual estilo usar em Icons.add;
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia; // o '_' indica que eh um atributo privado

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
