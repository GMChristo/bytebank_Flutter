import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
  }); //colocar os parametros no contrutor entre {} significa que sao opcionais

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
