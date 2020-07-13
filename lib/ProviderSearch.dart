import 'package:flutter/material.dart';

class ProviderSearch extends InheritedWidget {
  
  String search;
  final Widget child;

  ProviderSearch({this.search, this.child}):super(child: child);

  static ProviderSearch of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ProviderSearch)
    as ProviderSearch;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}