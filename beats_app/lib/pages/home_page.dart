import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:beats_app/widgets/cards_view.dart';
import 'package:beats_app/widgets/circular_background.dart';
import 'package:beats_app/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CircleBackground(),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(),
                _Header(),
                CardsView(),
              ],
            ),
          ),
        ),
        BuyButton(),
      ],
    ));
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 35.0),
          Text(
            'Beats',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'by Dre',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(50.0))),
            width: size.width * 0.3,
            height: 75.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Buy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5.0),
                Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
