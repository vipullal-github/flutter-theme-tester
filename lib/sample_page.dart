import 'package:flutter/material.dart';
import 'package:theming/app_data_provider.dart';
import 'package:theming/theme_picker.dart';
import 'package:provider/provider.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _maritalStatus = "";
  bool isDarkMode = false; // set in build

  List<DropdownMenuItem<int>> genderList = [];

  void _closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _makeDrawerMenu(BuildContext context) {
    Color? headerColor =
        Theme.of(context).navigationDrawerTheme.backgroundColor;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: headerColor),
            child: const Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              _closeDrawer(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              _closeDrawer(context);
            },
          ),
        ],
      ),
    );
  }

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
    //formWidgets.add(dumpTheme(context));

    return formWidgets;
  }

  Widget dumpTheme(BuildContext context) {
    ThemeData data = Theme.of(context);
    List<Widget> gridItems = [];
    gridItems.add(Text("Primary",
        style: TextStyle(
          backgroundColor: data.primaryColor,
        )));
    gridItems.add(
        Text("cardColor", style: TextStyle(backgroundColor: data.cardColor)));
    gridItems.add(Text("canvasColor",
        style: TextStyle(backgroundColor: data.canvasColor)));

    return GridView.count(
      crossAxisCount: 2,
      children: gridItems,
    );
  }

  void _gotoSettingsPage(BuildContext context) {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext context) {
      return const ThemePicker();
    });
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = context.read<AppDataProvider>().currentMode == ThemeMode.dark;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sample Page"),
          actions: [
            IconButton(
                onPressed: () {
                  _gotoSettingsPage(context);
                },
                icon: const Icon(Icons.settings)),
          ],
        ),
        drawer: _makeDrawerMenu(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(isDarkMode
                        ? "Switch to light Mode"
                        : "Switch to dark mode"),
                    Switch(
                      value: isDarkMode,
                      onChanged: (_) {
                        context.read<AppDataProvider>().toggleThemeMode();
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: _buildForm(context),
                  ),
                ),
                Expanded(child: dumpTheme(context)),
              ],
            ),
          ),
        ));
  }
}
