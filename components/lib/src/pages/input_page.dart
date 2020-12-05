import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _mail = '';
  String _pass = '';
  String _date = '';
  String _selectedPower = 'Fly';

  List<String> _powers = ['Fly', 'X ray vision', 'Super Strengh'];

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Text Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _createInput(),
            Divider(),
            _createEmailInput(),
            Divider(),
            _createPassInput(),
            Divider(),
            _createPerson(),
            Divider(),
            _createDateInput(context),
            Divider(),
            _createSelect(),
          ],
        ),
      );

  Widget _createInput() => TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text('Chars ${_name.length}'),
          // hintText: 'Person Name',
          labelText: 'Name',
          helperText: 'Just the name',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
        onChanged: (String value) => setState(() => _name = value),
      );

  Widget _createPerson() => ListTile(
        title: Text('Name is: $_name'),
        subtitle: Text('Mail: $_mail'),
      );

  Widget _createEmailInput() => TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (String value) => setState(() => _mail = value),
      );

  Widget _createPassInput() => TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock),
        ),
        onChanged: (String value) => setState(() => _pass = value),
      );

  Widget _createDateInput(BuildContext context) => TextField(
        controller: _dateController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Birth date',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );

  void _selectDate(BuildContext context) async {
    DateTime picked = (await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025)))!;
    _date = picked.toString();
    setState(() => _dateController.text = _date);
  }

  List<DropdownMenuItem<String>> _getOptions() => _powers
      .map((power) => DropdownMenuItem(
            value: power,
            child: Text(power),
          ))
      .toList();

  Widget _createSelect() => Row(
        children: <Widget>[
          Icon(Icons.select_all),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: DropdownButton(
              value: _selectedPower,
              items: _getOptions(),
              onChanged: (Object? option) {
                setState(() => _selectedPower = option.toString());
              },
            ),
          ),
        ],
      );
}
