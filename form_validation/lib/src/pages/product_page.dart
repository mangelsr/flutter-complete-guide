import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:form_validation/src/bloc/products_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ProductsBloc _productsBloc;
  ProductModel product = ProductModel();
  bool _loading = false;
  late File photo;

  @override
  Widget build(BuildContext context) {
    _productsBloc = Provider.productsBloc(context);
    final ProductModel productArg =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    if (productArg != null) {
      product = productArg;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _choosePhoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _takePhoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _buildImage(),
                _buildName(),
                _buildPrice(),
                _buildAvailable(),
                _buildSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      onSaved: (String? value) {
        product.title = value!;
      },
      validator: (String? value) {
        if (value!.length < 3) {
          return 'Enter a valid product name';
        }
        return null;
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Price',
      ),
      onSaved: (String? value) {
        product.value = double.parse(value!);
      },
      validator: (String? value) {
        return utils.isNumric(value!) ? null : 'Not valid';
      },
    );
  }

  Widget _buildSubmit() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      onPressed: _loading ? null : _submit,
      label: Text('Save'),
      color: Colors.deepPurple,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget _buildAvailable() {
    return SwitchListTile(
      value: product.available,
      title: Text('Available'),
      activeColor: Colors.deepPurple,
      onChanged: (bool value) => setState(() {
        product.available = value;
      }),
    );
  }

  void _submit() async {
    // Manda a validar todos los validators de todos los campos del formulario
    if (!formKey.currentState!.validate()) return;
    //Manda a ejecutar todos los onSaved de los controles dentro del formulario
    formKey.currentState!.save();
    String verb = '';
    setState(() {
      _loading = true;
    });
    if (photo != null) {
      product.photoUrl = await _productsBloc.uploadPhoto(photo);
    }
    if (product.id == null) {
      _productsBloc.addProduct(product);
      verb = 'created';
    } else {
      _productsBloc.editProduct(product);
      verb = 'updated';
    }
    setState(() {
      _loading = false;
    });
    _showSnackBar('Product $verb');
    Navigator.pop(context);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget _buildImage() {
    if (product.photoUrl != null) {
      return FadeInImage(
        image: NetworkImage(product.photoUrl!),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      return Image(
        image: AssetImage(photo?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  void _choosePhoto() async {
    _managePhoto(ImageSource.gallery);
  }

  void _takePhoto() async {
    _managePhoto(ImageSource.camera);
  }

  void _managePhoto(ImageSource source) async {
    final response = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (response == null) return;
    photo = response;
    if (photo != null) {
      product.photoUrl = null;
    }
    setState(() {});
  }
}
