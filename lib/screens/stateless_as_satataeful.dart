// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatelessAsSatateful extends StatelessWidget {
  StatelessAsSatateful({super.key});

  ValueNotifier<int> statlessCounter = ValueNotifier<int>(200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stateless As Statefull",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: statlessCounter,
            builder: (context, value, child) {
              return Text(statlessCounter.value.toString(),
                  style: TextStyle(fontSize: 50));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          statlessCounter.value--;
          print(statlessCounter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
