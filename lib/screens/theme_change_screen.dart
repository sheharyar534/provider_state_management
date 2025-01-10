// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeChangerProvider>(context, listen: false);
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Theme Chnage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<ThemeChangerProvider>(builder: (context , values , child){return   RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: values.getChangeTheme,
              onChanged: (value) {
                values.setTheme(value);
              });}),
          Consumer<ThemeChangerProvider>(builder: (context , values , child){return   RadioListTile<ThemeMode>(
              title: Text("dark Mode"),
              value: ThemeMode.dark,
              groupValue: values.getChangeTheme,
              onChanged: (value) {
                values.setTheme(value);
              });}),
          Consumer<ThemeChangerProvider>(builder: (context , values , child){return  RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.getChangeTheme,
              onChanged: (value) {
                themeProvider.setTheme(value);
              });})
        
         
          
        ],
      ),
    );
  }
}
