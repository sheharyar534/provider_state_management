import 'package:flutter/material.dart';
import 'package:flutter_provider_state/screens/counter_screen.dart';
import 'package:flutter_provider_state/screens/favorite_screen.dart';
import 'package:flutter_provider_state/screens/slider_example_screen.dart';
import 'package:flutter_provider_state/screens/theme_change_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'provider State Managemenet',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.096,
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Provider",
                        style: TextStyle(fontSize: 50),
                      ),
                      Text("satate managment")
                    ],
                  ),
                ),
              )),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Count Example'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorate Example'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text('Slider Example'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SliderExampleScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb_circle),
                title: Text('Theme Mode'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThemeChangeScreen()));
                },
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO PROVIDER',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 350,
              child: Text(
                "If you want to explore the example through provier , Pleas visit he examples in the drawer.",
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
