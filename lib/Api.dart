import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDnwIH6f1EOsdDmPDDMukzMN8qo1uWTU6M";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> search(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE + "search" +
        "?part=snippet" +
        "&type=video" +
        "&maxResults=20" +
        "&order=date" + 
        //* Parâmetro Obrigatório
        "&key=$CHAVE_YOUTUBE_API"// +
        //* Recuperar vídeos de um canal especifico
        //*  Caso não coloque o Id canal, será retorna
        //*  Vídeos de todo youtube 
        //"&channelId=$ID_CANAL" +
        "&channelId=UCS6Js0lQvGUDUP5R-UIAvQw"
        "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      
      //Convertendo os videos do JSON a uma classe Video  
      // e adicionando a uma lista
      List<Video> videos = dadosJson["items"].map<Video>(
        (map) => Video.fromJson(map),
      ).toList();

      //Retorna Lista de Vídeos
      return videos;      
    }
    else{
      return null;
    }
  }

}