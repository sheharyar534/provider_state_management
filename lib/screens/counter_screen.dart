// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    //provider
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      counterProvider.setCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    //provider
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    print(counterProvider.counter);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counrter Example',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('please push the add button for increament'),
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text(value.counter.toString(),
                  style: TextStyle(fontSize: 50));
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
