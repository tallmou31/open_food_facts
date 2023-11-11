import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_food_facts/res/app_colors.dart';
import 'package:open_food_facts/res/app_icons.dart';
import 'package:open_food_facts/res/app_vectorial_images.dart';

class MyScansPage extends StatelessWidget {
  const MyScansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Mes Scans',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  AppIcons.barcode,
                  color: Colors.black,
                ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(AppVectorialImages.illEmpty),
            const SizedBox(height: 50),
            const Text("Vous n'avez pas encore scanné de produits"),
            const SizedBox(height: 20),
            TextButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
                backgroundColor: AppColors.yellow,
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Commencer'.toUpperCase()),
                  const Icon(Icons.arrow_right_alt, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
