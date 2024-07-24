import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: HomeState(),
  ));
}

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {

  var _imgPadrao = AssetImage("imagens/padrao.png");
  var _imgPedra = "imagens/pedra.png";
  var _imgPapel = "imagens/papel.png";
  var _imgTesoura = "imagens/tesoura.png";
  var _textOpcao = "Escolha uma opção:";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuário: " + escolhaUsuario);

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imgPadrao = AssetImage(_imgPedra);
        });
        break;
      case "papel":
        setState(() {
          this._imgPadrao = AssetImage(_imgPapel);
        });
        break;
      case "tesoura":
        setState(() {
          this._imgPadrao = AssetImage(_imgTesoura);
        });
        break;
    }

    //Usuario Vencedor
    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        _textOpcao = "Você ganhou!";
      });
    }else if (
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        _textOpcao = "Você perdeu!";
      });
    }else if(escolhaUsuario == escolhaApp){
      setState(() {
        _textOpcao = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text("Escolha do App:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          ),

          /*Widget para captura de gestos na tela
          GestureDetector(
            onTap: (){
              print("askbjdasjldas");
            },
            child: Image.asset(_imgPadrao)
          ),
          */

          Image(image: this._imgPadrao),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(_textOpcao,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(_imgPedra, height: 100)
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(_imgPapel, height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(_imgTesoura, height: 100),
              )
              /*
              Image.asset(_imgPedra, height: 100),
              Image.asset(_imgPapel, height: 100),
              Image.asset(_imgTesoura, height: 100)
               */
            ],
          )
        ],
      ),
    );
  }
}
