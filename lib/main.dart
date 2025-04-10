import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widgets Bonus',
      home: DynamicAreasScreen(),
    );
  }
}

class DynamicAreasScreen extends StatefulWidget {
  const DynamicAreasScreen({super.key});

  @override
  State<DynamicAreasScreen> createState() => _DynamicAreasScreenState();
}

class _DynamicAreasScreenState extends State<DynamicAreasScreen> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFDCCF),
      appBar: AppBar(
        title: const Text('Dynamische Anpassungen'),
        backgroundColor: Color(0xFF1995AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Slider(
              thumbColor: Color(0xFF1995AD),
              activeColor: Color(0xFFA1D6E2),
              inactiveColor: Color(0xFFE05858),
              value: _sliderValue,
              min: 1,
              max: 5,
              divisions: 4,
              label: _sliderValue.roundToDouble().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFF68829E),
                alignment: Alignment.center,
                child: Text(
                  'Fester FlexWert: 1',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: _sliderValue.round(),
              child: Container(
                color: Color(0xFFF4CC70),
                alignment: Alignment.center,
                child: Text(
                  'Dynamischer FlexWert: ${_sliderValue.round()}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 105, 32, 179),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFDE7A22),
                alignment: Alignment.center,
                child: Text(
                  'Und hier wieder ein fester FlexWert: 1',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
