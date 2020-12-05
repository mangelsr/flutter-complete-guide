import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            _cardType1(),
            SizedBox(height: 30.0),
            _cardType2(),
            SizedBox(height: 30.0),
            _cardType1(),
            SizedBox(height: 30.0),
            _cardType2(),
            SizedBox(height: 30.0),
            _cardType1(),
            SizedBox(height: 30.0),
            _cardType2(),
          ],
        ),
      ),
    );
  }

  Card _cardType1() => Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.photo_album,
                color: Colors.blue,
              ),
              title: Text('Titulo de esta tarjeta'),
              subtitle: Text(
                  '................................................................'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );

  Container _cardType2() => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0)),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          child: Column(
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(
                    'https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1100,c_fill,g_auto,h_619,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190517090800-02-unusual-landscapes-travel.jpg'),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 250.0,
                fit: BoxFit.cover,
              ),
              // Image(
              //   image: NetworkImage(
              //       'https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1100,c_fill,g_auto,h_619,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190517090800-02-unusual-landscapes-travel.jpg'),
              // ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('No tengo idea de que poner')),
            ],
          ),
        ),
      ));
}
