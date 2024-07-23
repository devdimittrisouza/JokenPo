import 'package:flutter/material.dart';

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

  var _textOpcao = "Escolha uma opção:";

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

          //Widget para captura de gestos na tela
          GestureDetector(
            onTap: (){
              print("askbjdasjldas");
            },
            child: Image.asset("imagens/padrao.png")
          ),
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
              Image.asset("imagens/pedra.png", height: 100),
              Image.asset("imagens/papel.png", height: 100),
              Image.asset("imagens/tesoura.png", height: 100)
            ],
          )
        ],
      ),
    );
  }
}
