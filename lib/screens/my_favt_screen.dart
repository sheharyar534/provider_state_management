import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MyFavtScreen extends StatefulWidget {
  const MyFavtScreen({super.key});

  @override
  State<MyFavtScreen> createState() => _MyFavtScreenState();
}

class _MyFavtScreenState extends State<MyFavtScreen> {
  @override
  Widget build(BuildContext context) {
    final favtProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorite Items',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: favtProvider.favoriteItem.length,
          itemBuilder: (context, index) {
            return Consumer<FavoriteProvider>(builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  value.removeFavrt(index);
                },
                title: Text('item $index'),
                trailing: Icon(
                  value.favoriteItem.contains(index) ? Icons.favorite : Icons.favorite_outline
                ),
              );
            });
          }),
    );
  }
}
