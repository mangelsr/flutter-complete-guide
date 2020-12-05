import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 250.0;
  bool _blockSpinner = false;

  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Slider'),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                _createSlider(),
                _createCheckboxListTile(),
                _createSwitchListTile(),
                Expanded(child: _createImage()),
              ],
            ),
          ),
        ),
      );

  Slider _createSlider() => Slider(
        activeColor: Colors.indigo,
        label: 'Image size',
        value: _value,
        min: 0.0,
        max: 500.0,
        onChanged: (_blockSpinner)
            ? null
            : (newValue) => setState(() => _value = newValue),
      );

  Image _createImage() => Image(
        image: NetworkImage(
            'https://www.dccomics.com/sites/default/files/Char_GetToKnow_Batman80_5ca54cb83a27a6.53173051.png'),
        width: _value,
        fit: BoxFit.contain,
      );

  Checkbox _createCheckbox() => Checkbox(
        value: _blockSpinner,
        onChanged: (bool? newValue) =>
            setState(() => _blockSpinner = newValue!),
      );

  CheckboxListTile _createCheckboxListTile() => CheckboxListTile(
        title: Text('Bloquear Spinner'),
        value: _blockSpinner,
        onChanged: (bool? newValue) =>
            setState(() => _blockSpinner = newValue!),
      );

  SwitchListTile _createSwitchListTile() => SwitchListTile(
        title: Text('Bloquear Spinner'),
        value: _blockSpinner,
        onChanged: (newValue) => setState(() => _blockSpinner = newValue),
      );
}
