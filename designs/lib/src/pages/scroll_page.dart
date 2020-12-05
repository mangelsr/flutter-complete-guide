import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _page1(),
            _page2(),
          ],
        ),
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[
        _backGroundColor(),
        _backgroundImage(),
        _texts(),
      ],
    );
  }

  Widget _page2() {
    return Stack(
      children: <Widget>[
        _backGroundColor(),
        Center(
          child: RaisedButton(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            onPressed: () {},
            child: Text('Welcome', style: TextStyle(fontSize: 20.0),),
            elevation: 8.0,
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _backGroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(8, 192, 218, 1.0),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texts() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50.0,
    );
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('11*', style: textStyle),
          Text('Miercoles', style: textStyle),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 70.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
