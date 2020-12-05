import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    final subtitleStyle = TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildImage(),
            _buildTile(titleStyle, subtitleStyle),
            _buildActions(),
            _buildText(),
            _buildText(),
            _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(TextStyle titleStyle, TextStyle subtitleStyle) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago con un puente', style: titleStyle),
                  SizedBox(height: 7.0),
                  Text('Lorem..............', style: subtitleStyle),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.maxFinite,
      child: Image(
        image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg/1280px-Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg'),
            height: 200.0,
            fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAction('Call', Icons.call),
        _buildAction('Route', Icons.near_me),
        _buildAction('Share', Icons.share),
      ],
    );
  }

  Widget _buildAction(String text, IconData icon) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(height: 5.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Text(
          'Nisi cillum eiusmod aute ea eiusmod ex. Consequat pariatur officia aliqua incididunt Lorem nisi. Adipisicing nostrud cillum aliqua sit fugiat nostrud sunt. Quis adipisicing reprehenderit occaecat ea reprehenderit amet cupidatat consequat sint laboris excepteur. Aliquip tempor aliquip incididunt occaecat eu do. In laboris amet officia nisi. Excepteur nostrud incididunt sit velit et est.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
