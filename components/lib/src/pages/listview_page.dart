import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  ScrollController _sCrontoller = ScrollController();

  @override
  void initState() {
    super.initState();
    _add10();
    _sCrontoller.addListener(() {
      if (_sCrontoller.position.pixels ==
          _sCrontoller.position.maxScrollExtent) {
        // _add10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sCrontoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: Stack(
          children: <Widget>[
            _createList(context),
            _createLoading(),
          ],
        ));
  }

  RefreshIndicator _createList(context) {
    return RefreshIndicator(
      onRefresh: _getPage,
      child: ListView.builder(
        controller: _sCrontoller,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  void _add10() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    return Timer(Duration(seconds: 2), _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;
    _sCrontoller.animateTo(_sCrontoller.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _add10();
  }

  Widget _createLoading() =>
      Center(child: _isLoading ? CircularProgressIndicator() : Container());

  Future _getPage() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _add10();
    });
    return Future.delayed(duration);
  }
}
