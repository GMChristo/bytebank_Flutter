import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/material-library.html - pagina do flutter com os widgets;

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //aplica o widget de Scaffold, um layout;
        body: ListaTransferencias(),
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
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da Conta',
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: '0.00',
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                //tb pode ser escrito como: onPressed () => criaTransferencia()
                _criaTransferencia(context);
              },
            ),
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta
        .text); //cria variavel para receber o num da conta, o parse converte ela de text para int
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint(
          '$transferenciaCriada'); //serve para apresentar msg no console, igual printf, '$transferenciaCriada' vai imprimir o valor da variavel
          Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor(
      {this.controlador,
      this.rotulo,
      this.dica,
      this.icone}); //colocar os parametros no contrutor entre {} significa que sao opcionais

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          16.0), //padding cria o espaço entre os widgets, o .all aplica a toda a borda padding o msm valor
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize:
                24.0 //define o tamanho da fonte que informa o nome do campo
            ),
        decoration: InputDecoration(
          icon: icone != null
              ? Icon(icone)
              : null, //verifica se recebeu do contrutor um icone, se sim apresenta o icone se nao retorna null
          labelText: rotulo, //apresenta o nome do campo
          hintText: dica, //mostra uma dica quando o campo eh selecionado
        ),
        keyboardType: TextInputType
            .number, //define o tipo de teclado que sera mostrado ao selecionar o campo, nesse caso teclado numerico
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  //StatelessWidget nao tem a capacidade de alterar o conteudo diferente do StatefulWidget que consegue alterar o conteudo;

  final List<Transferencia> _transferencias = List(); //cria uma lista de Transferencias

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //adiciona um widget de AppBar ao layout ja existente;
        title:
            Text('Transferências!'), //define o texto que eh mostrado na Appbar;
      ),
      body: ListView.builder(
        itemCount: _transferencias.length, // define o tamanho da lista a ser apresentada na tela de acordo com a quantidade na List
        itemBuilder: (context, indice){
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        //adiciona um botao flutuante;
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            //Future implementa um callback que vai funcionar para receber uma possivel resposta durante a navegação
            //O <Transferencia> esta informando que o retorno vai ser do tipo Transferencia
            // Navigator.push eh o comando para implementar a mudança de tela
            context,
            MaterialPageRoute(builder: (context) {
              //MaterialPageRoute eh usado para efetuar toda a tarefa de trasnsição de tela
              return FormularioTransferencia();
            }),
          );
          future.then((transferenciaRecebida){
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida); //adiciona a transferencia que veio do future na lista
          },);
        },
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
