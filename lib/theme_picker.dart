import 'package:flutter/material.dart';

class ThemePicker extends StatefulWidget {
  const ThemePicker({super.key});

  @override
  State<ThemePicker> createState() => _ThemePickerState();
}

class _ThemePickerState extends State<ThemePicker> {
  static const String fromSwatchColor = "FromSwatch";
  static const String fromColorSet = "FromColorSet";

  String _palletGenerationMethod = fromSwatchColor;

  Widget _buildMethodSelectorPannel(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: RadioListTile<String>(
            title: const Text(fromSwatchColor),
            value: fromSwatchColor,
            groupValue: _palletGenerationMethod,
            onChanged: (value) {
              setState(() {
                _palletGenerationMethod = value.toString();
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: const Text(fromColorSet),
            value: fromColorSet,
            groupValue: _palletGenerationMethod,
            onChanged: (value) {
              setState(() {
                _palletGenerationMethod = value.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _colorSetPannel(BuildContext context) {
    return const Text("Color set pannel");
  }

  Widget _buildColorBox(Color aColor) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        decoration: BoxDecoration(color: aColor, shape: BoxShape.circle),
      ),
    );
  }

  Widget _swatchPannel(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: [
        _buildColorBox(Colors.red),
        _buildColorBox(Colors.pink),
        _buildColorBox(Colors.purple),
        _buildColorBox(Colors.deepPurple),
        _buildColorBox(Colors.indigo),
        _buildColorBox(Colors.blue),
        _buildColorBox(Colors.lightBlue),
        _buildColorBox(Colors.cyan),
        _buildColorBox(Colors.teal),
        _buildColorBox(Colors.green),
        _buildColorBox(Colors.lime),
        _buildColorBox(Colors.lightBlue),
      ],
    );
  }

  Widget _buildColorSelectorPannel(BuildContext context) =>
      _palletGenerationMethod == fromColorSet
          ? _colorSetPannel(context)
          : _swatchPannel(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ThemePicker")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text("Select how you want to build the Material Theme"),
              Expanded(flex: 1, child: _buildMethodSelectorPannel(context)),
              Expanded(flex: 4, child: _buildColorSelectorPannel(context)),
            ],
          ),
        ));
  }
}
