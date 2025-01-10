// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/favorite_provider.dart';
import 'package:flutter_provider_state/screens/my_favt_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favtProvider = Provider.of<FavoriteProvider>(context , listen:  false);
    print("favourate added");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Example',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavtScreen()));
            },
            child: Icon(Icons.favorite, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      title: Text('Item $index'),
                      trailing: Icon(
                        value.favoriteItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                      onTap: () {
                        if (value.favoriteItem.contains(index)) {
                          value.removeFavrt(index);
                        } else {
                          value.setFavrt(index);
                        }
                      },
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
