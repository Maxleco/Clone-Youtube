import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/ProviderSearch.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    Api api = Api();
    return api.search(ProviderSearch.of(context).search);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        Widget result;
        if (snapshot.connectionState == ConnectionState.waiting) {
          result = Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text("Not Found"),
              );
            }
            result = ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                List<Video> videos = snapshot.data;
                Video video = videos[index];

                //* Widget _cardVideo é um estrutura para colocar items da lista
                return _cardVideo(
                  id: video.id,
                  title: video.title,
                  channel: video.channel,
                  image: video.image,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 3,
                color: Colors.grey,
              ),
              itemCount: snapshot.data.length,
            );
          } else {
            result = Center(
              child: Text("Not Found"),
            );
          }
        }
        return result;
      },
    );
  }

  Widget _cardVideo(
    {String title, String image, String channel, String id}
  ){
    return GestureDetector(
      onTap: (){
        FlutterYoutube.playYoutubeVideoById(
          apiKey: CHAVE_YOUTUBE_API,          
          videoId: id,
          autoPlay: true, //default falase
          fullScreen: false,
          appBarColor: Color(0xFF4d4d4d),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(channel),
            ),
          ],
        ),
      ),
    );
  }
}
