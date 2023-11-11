import 'package:flutter/material.dart';
import 'package:open_food_facts/details.dart';
import 'package:open_food_facts/domain/models/all_models.dart';
import 'package:open_food_facts/res/app_colors.dart';
import 'package:open_food_facts/res/app_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Avenir',
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow, primary: AppColors.blue),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        appBarTheme: const AppBarTheme(foregroundColor: AppColors.blue),
        useMaterial3: true,
      ),
      home:  DetailsFiche(product: Product(
          barcode: '1234',
          name: 'Petits pois et carottes',
          altName: 'Cassegrain',
          picture: AppImages.pancake,
          nutriScore: ProductNutriscore.B,
          novaScore: ProductNovaScore.Group2,
          ecoScore: ProductEcoScore.B,
          quantity: '200g (egoutté 160g)',
          manufacturingCountries: ['France'],
        ),
      ),
    );
  }
}
