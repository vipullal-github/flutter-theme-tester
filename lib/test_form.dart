import 'package:flutter/material.dart';

class TestForm extends StatefulWidget {
  const TestForm({super.key});

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _maritalStatus = "";

  List<DropdownMenuItem<int>> genderList = [];

  buildGenderList() {
    genderList.add(const DropdownMenuItem(
      value: 0,
      child: Text("Male"),
    ));
    genderList.add(const DropdownMenuItem(
      value: 0,
      child: Text("Female"),
    ));
    genderList.add(const DropdownMenuItem(
      value: 0,
      child: Text("Prefer not to say"),
    ));
  }

  Widget _getNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    );
  }

  Widget _getGenderField() {
    return Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
      ],
    );
  }

  List<Widget> _buildForm(BuildContext context) {
    List<Widget> formWidgets = [];
    const Widget spacer = SizedBox(
      height: 12,
    );
    formWidgets.add(const Card(
      elevation: 8.0,
      child: Text("Test Card"),
    ));
    formWidgets.add(spacer);
    formWidgets.add(_getNameField());
    formWidgets.add(spacer);
    formWidgets.add(_getGenderField());
    formWidgets.add(spacer);
    formWidgets.add(ElevatedButton(
      onPressed: () {},
      child: const Text("Ok"),
    ));
    formWidgets.add(dumpTheme(context));

    return formWidgets;
  }

  Widget dumpTheme(BuildContext context) {
    ThemeData data = Theme.of(context);
    List<Widget> gridItems = [];
    gridItems.add( Text("Primary", style: TextStyle( backgroundColor: data.primaryColor )));
    gridItems.add( Text("cardColor", style: TextStyle( backgroundColor: data.cardColor )));
    gridItems.add( Text("canvasColor", style: TextStyle( backgroundColor: data.canvasColor )));
    

    return GridView.count(
      crossAxisCount: 2,
      children: gridItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form stuff"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: _buildForm(context),
            ),
          ),
        ));
  }
}
