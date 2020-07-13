import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.grey,
        onPressed: () {
          //* Apagar texto de consulta
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.grey,
      onPressed: () {
        //* Retorna para a tela anterior e retornando null
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("Resultado: Pesquisa realisada");
    //* Quando aperta o botão de Pesquisa no teclado
    close(context, query);
    //* Não pode retorna Nulo
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    );    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("Resultado: digitado " + query);
    //* Não pode retorna Nulo
    //* Sugestões que apareceram no body da tela.
    if(query.isNotEmpty){

      List<String> lista = [
        "Kotlin", 
        "What",
        "Android Studio",
        "AndroidX",
        "enums",
        "game"
      ].where(
        //* Deixam todos minusculos para que possa identificar e
        //*  não haver diferenciação entre maiusculo e minusculo
        (element) => element.toLowerCase().startsWith(query.toLowerCase())    
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        }
      );
    }
    else{
      return Center(
        child: Text("Nenhum Resultado para pesquisa"),
      );
    }
    
  }
}
