// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExampleScreen extends StatefulWidget {
  const SliderExampleScreen({super.key});

  @override
  State<SliderExampleScreen> createState() => _SliderExampleScreenState();
}

class _SliderExampleScreenState extends State<SliderExampleScreen> {
  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    print(sliderProvider.opacityValue);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slider Example',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('please drag the slider below to go low to high'),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.opacityValue,
                onChanged: (val) {
                  value.setOpacity(val);
                });
          }),

          Consumer<SliderProvider>(builder: (context,value,child){
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(value.opacityValue),
                  ),
                  child: Center(
                      child: Text(
                    'Blue',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color:
                        Colors.amber.withOpacity(value.opacityValue),
                  ),
                  child: Center(
                      child: Text(
                    'amber',
                    style: TextStyle(color: Colors.black87),
                  )),
                ),
              )
            ],
          );
                })
         
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
