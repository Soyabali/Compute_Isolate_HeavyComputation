import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeavyComputationExample(),
    );
  }
}

class HeavyComputationExample extends StatefulWidget {
  @override
  _HeavyComputationExampleState createState() => _HeavyComputationExampleState();
}

class _HeavyComputationExampleState extends State<HeavyComputationExample> {
  String _result = '';

  void _performHeavyComputation() async {
    print('-------26------');
    // call a compute function
    final result = await compute<int, String>(heavyComputation, 10000);
    setState(() {
      _result = result;
    });
  }

  static String heavyComputation(int iterations) {
    double sum = 0;
    for (int i = 0; i < iterations; i++) {
      sum += i * i;
    }
    return 'Result: $sum';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Computation Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _performHeavyComputation,
              child: Text('Run Heavy Computation'),
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}