import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:news_app/src/pages/tab1_page.dart';
import 'package:news_app/src/pages/tab2_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NavegationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavegationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (int i) => navigationModel.actualPage = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Para ti')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Encabezados')),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = PageController();

  int get actualPage => this._actualPage;

  set actualPage(int value) {
    this._actualPage = value;
    this._pageController.animateToPage(
          value,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
