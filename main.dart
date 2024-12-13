 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with a Twist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // Initial counter value
  double _step = 1; // Step value for incrementing and decrementing

  // Increment the counter by the step value
  void _increment() {
    setState(() {
      _counter += _step.toInt(); // Increment by step
    });
  }

  // Decrement the counter by the step value
  void _decrement() {
    setState(() {
      _counter -= _step.toInt(); // Decrement by step
    });
  }

  // Reset the counter
  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  // Update the step value based on slider
  void _updateStep(double newValue) {
    setState(() {
      _step = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App with a Twist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display current counter value inside a Card widget
            Card(
              elevation: 4,
              color: const Color.fromARGB(255, 228, 254, 225),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Counter: $_counter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 243, 145, 33),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Slider to adjust the step value
            Text(
              'Step value: ${_step.toInt()}',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _step,
              onChanged: _updateStep,
            ),
            SizedBox(height: 20),
            
            // Row of buttons for increment, decrement, and reset
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _increment,
                  child: Text('Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrement,
                  child: Text('Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _reset,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


