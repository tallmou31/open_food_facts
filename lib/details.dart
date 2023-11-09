import 'package:flutter/material.dart';
import 'package:open_food_facts/domain/models/all_models.dart';
import 'package:open_food_facts/res/app_colors.dart';
import 'package:open_food_facts/res/app_images.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    super.key,
    required this.name,
    required this.altName,
    required this.picture,
  });

  final String name;
  final String altName;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(picture),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reply, color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                altName,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: AppColors.gray3,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailsFiche extends StatelessWidget {
  const DetailsFiche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          DetailsHeader(
            name: 'Petits pois et carottes',
            altName: 'Cassegrain',
            picture: AppImages.pancake,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 44,
                  child: ProductNutriscoreWidget(score: ProductNutriscore.A),
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 50,
                  child: ProductNovaScoreWidget(score: ProductNovaScore.Group1),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ProductEcoScoreWidget(score: ProductEcoScore.A),
          ),

        ],
      ),
    );
  }
}

class ProductNovaScoreWidget extends StatelessWidget {
  const ProductNovaScoreWidget({Key? key, required this.score})
      : super(key: key);

  final ProductNovaScore score;

  String getText(ProductNovaScore score) {
    return switch (score) {
    ProductNovaScore.Group1 =>
    'Aliments non transformés ou transformés minimalement'
    ,
    ProductNovaScore.Group2 => 'Ingrédients culinaires transformés',
    ProductNovaScore.Group3 => 'Aliments transformés',
    ProductNovaScore.Group4 => "Produits alimentaires et boissons ultra-transformés",
  };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Groupe NOVA", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark, fontFamily: "Avenir"),),
          Text(getText(score), style: const TextStyle(fontSize: 14, color: AppColors.gray3, fontFamily: "Avenir"),),
        ],
      ),
    );
  }
}

class ProductEcoScoreWidget extends StatelessWidget {
  const ProductEcoScoreWidget({Key? key, required this.score})
      : super(key: key);

  final ProductEcoScore score;

  String getText(ProductEcoScore score) {
    return switch (score) {
      ProductEcoScore.A => 'Très faible impact environnemental',
      ProductEcoScore.B => 'Faible impact environnemental',
      ProductEcoScore.C => "Impact modéré sur l'environnement",
      ProductEcoScore.D => 'Impact environnemental élevé',
      ProductEcoScore.E => 'Impact environnemental très élevé',

    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("EcoScore", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark, fontFamily: "Avenir"),),
          Text(getText(score), style: const TextStyle(fontSize: 18, color: AppColors.gray3, fontFamily: "Avenir"),),
        ],
      ),
    );
  }
}

class ProductNutriscoreWidget extends StatelessWidget {
  const ProductNutriscoreWidget({Key? key, required this.score})
      : super(key: key);

  final ProductNutriscore score;

  String getImage(ProductNutriscore score) {
    return switch (score) {
    ProductNutriscore.A =>
    AppImages.nutriscoreA
    ,
    ProductNutriscore.B => AppImages.nutriscoreB,
    ProductNutriscore.C => AppImages.nutriscoreC,
    ProductNutriscore.D => AppImages.nutriscoreD,
    ProductNutriscore.E => AppImages.nutriscoreE
    ,
  };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(getImage(score)),
    );
  }
}
