import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/ProviderSearch.dart';
import 'package:youtube/screens/Biblioteca.dart';
import 'package:youtube/screens/EmAlta.dart';
import 'package:youtube/screens/Inicio.dart';

import 'screens/Inscricoes.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _itemBar;
  PageController _controllerPage;

  @override
  void initState() {
    _itemBar = 0;
    _controllerPage = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("Ação: Vídeo CAM");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              print("****************************" + "result " + result);
              setState(() {
                ProviderSearch.of(context).search = result;
              });       
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("Ação: Conta");
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _controllerPage,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _itemBar,
        onTap: (index) {
          setState(() {
            _controllerPage.jumpToPage(index);
            _itemBar = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.video_library),
          ),
        ],
      ),
    );
  }
}
