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
    return Expanded(
      child: Row(
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
      ),
    );
  }

  Widget _colorsetPannel(BuildContext context) {
    return const Text("Color set pannel");
  }

  Widget _swatchPannel(BuildContext context) {
    return const Text("Swatch pannel");
  }

  Widget _buildColorSelectorPannel(BuildContext context) =>
      _palletGenerationMethod == fromColorSet
          ? _colorsetPannel(context)
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
              _buildMethodSelectorPannel(context),
              _buildColorSelectorPannel(context),
            ],
          ),
        ));
  }
}
