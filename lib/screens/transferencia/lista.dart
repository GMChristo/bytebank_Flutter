import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências!';

class ListaTransferencias extends StatefulWidget {
  //StatelessWidget nao tem a capacidade de alterar o conteudo diferente do StatefulWidget que consegue alterar o conteudo;

  final List<Transferencia> _transferencias = List(); //cria uma lista de Transferencias

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //adiciona um widget de AppBar ao layout ja existente;
        title:
            Text(_tituloAppBar), //define o texto que eh mostrado na Appbar;
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length, // define o tamanho da lista a ser apresentada na tela de acordo com a quantidade na List
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
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
            _atualiza(transferenciaRecebida);
          },);
        },
        child: Icon(Icons
            .add), //child serve para colocar um widget dentro de outro widget;
        //Icons - cria um botao, importando os estilos de Icon, e selecionando qual estilo usar em Icons.add;
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if(transferenciaRecebida != null){ //if usado para caso a pessoa volte para pagina anterior sem adicionar nada nao de erro no sistema
      setState(() { //setState e usado para atualizar dinamicamente o statefulwidget, sem isso a pagina nao vai atualizar automaticamente
        widget._transferencias.add(transferenciaRecebida); //adiciona a transferencia que veio do future na lista  
      });
    }
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