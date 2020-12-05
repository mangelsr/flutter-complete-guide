import 'package:flutter/material.dart';

import 'package:form_validation/src/bloc/products_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/preferences/preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsBloc = Provider.productsBloc(context);
    productsBloc.loadProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              final prefs = UserPreferences();
              prefs.token = '';
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
      body: _buildList(productsBloc),
      floatingActionButton: _buildFab(context),
    );
  }

  FloatingActionButton _buildFab(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }

  Widget _buildList(ProductsBloc productsBloc) {
    return StreamBuilder(
      stream: productsBloc.productsStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildItem(context, products[index], productsBloc),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildItem(
      BuildContext context, ProductModel product, ProductsBloc productsBloc) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (DismissDirection direction) {
        productsBloc.deleteProduct(product.id!);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: <Widget>[
            (product.photoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    image: NetworkImage(product.photoUrl!),
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text('${product.title} - \$${product.value}'),
              subtitle: Text(product.id!),
              onTap: () =>
                  Navigator.pushNamed(context, 'product', arguments: product),
            ),
          ],
        ),
      ),
    );
  }
}
