import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/profile%20screens/widgets/favoriteCard.dart';

import '../../global variables/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.05,
              width: double.infinity,
              color: MainGreen,
              child: Text(
                'Favorites',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.left,
              ),
            ),
            FavoriteCardItem(),
            FavoriteCardItem(),
            FavoriteCardItem(),
          ],
        ),
      ),
    );
  }
}
