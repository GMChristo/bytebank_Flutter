import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferencia';
const _dicaAppBar = '0000';
const _rotuloAppBar = 'Número da Conta';
const _dicaCampoNumeroConta = '0.00';
const _rotuloCampoNumeroConta = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaAppBar,
                rotulo: _rotuloAppBar,
              ),
              Editor(
                controlador: _controladorCampoValor,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  //tb pode ser escrito como: onPressed () => criaTransferencia()
                  _criaTransferencia(context);
                },
              ),
            ],
          ),
        ));
  }
  
  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta
        .text); //cria variavel para receber o num da conta, o parse converte ela de text para int
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint(
          '$transferenciaCriada'); //serve para apresentar msg no console, igual printf, '$transferenciaCriada' vai imprimir o valor da variavel, pode tirar
          Navigator.pop(context, transferenciaCriada);
    }
  }
}
