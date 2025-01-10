import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/auth_provider.dart';
import 'package:flutter_provider_state/provider/counter_provider.dart';
import 'package:flutter_provider_state/provider/favorite_provider.dart';
import 'package:flutter_provider_state/provider/slider_provider.dart';
import 'package:flutter_provider_state/provider/theme_changer_provider.dart';
import 'package:flutter_provider_state/screens/login_screen.dart';
import 'package:flutter_provider_state/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // for single provider
    // return ChangeNotifierProvider(
    //     create: (_) => CounterProvider(),
    //     child: MaterialApp(home: SliderExampleScreen()));

    // for multi provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      // we made a builder here becuase the provider.of(context) need context to be implement thats why we created a builder to get conytext for the ptovider ton implement S
      child: Builder(builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.getChangeTheme,
          darkTheme: ThemeData(brightness: Brightness.dark),
          theme: ThemeData(
              brightness: Brightness.light, primarySwatch: Colors.amber),
          home: LoginScreen(),
        );
      }),
    );
  }
}
