import 'package:beats_app/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:beats_app/providers/products_provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Container(
      width: double.infinity,
      height: 360.0,
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children:
            productsProvider.products.map((product) => _Card(product)).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  ProductModel product;

  _Card(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _Description(product),
              SizedBox(width: 55.0),
              _CardDescription(product),
            ],
          ),
          Positioned(
            top: 30,
            left: 50,
            child: Image(
              image: AssetImage('assets/${product.url}'),
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  ProductModel product;

  _CardDescription(this.product);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        width: size.width * 0.55,
        height: 340.0,
        color: Color(product.color),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0),
            RotatedBox(
              quarterTurns: 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white24,
                    ),
                  ),
                  Text(
                    product.subtitle,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 80.0,
                  child: Text(
                    '\$${this.product.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 120.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Add to bag',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  ProductModel product;

  _Description(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.batteryFull,
              size: 15.0,
            ),
            SizedBox(width: 10.0),
            Text(
              '40-Hour Battery',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(width: 30),
            Icon(
              FontAwesomeIcons.wifi,
              size: 15.0,
            ),
            SizedBox(width: 10.0),
            Text(
              '40-Hour Battery',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
