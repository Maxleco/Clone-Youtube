import 'package:flutter/material.dart';

import 'HomeWidget.dart';
import 'ProviderSearch.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProviderSearch(
        search: "",
        child: HomeWidget(),
      ),     
    );
  }
}
