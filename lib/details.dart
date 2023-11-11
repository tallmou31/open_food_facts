import 'package:flutter/material.dart';
import 'package:open_food_facts/domain/models/all_models.dart';
import 'package:open_food_facts/res/app_colors.dart';
import 'package:open_food_facts/res/app_icons.dart';
import 'package:open_food_facts/res/app_images.dart';


class DetailsFiche extends StatelessWidget {
  const DetailsFiche({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child:  Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(product.picture!),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
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
          Positioned.fill(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height + 15.0,
                  margin: const EdgeInsets.only(top: 235),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsHeader(name: product.name ?? '', altName: product.altName ?? ''),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                      DetailsBandeau(
                          nutriScore: product.nutriScore ?? ProductNutriscore.A,
                          novaScore: product.novaScore ?? ProductNovaScore.Group1,
                          ecoScore: product.ecoScore ?? ProductEcoScore.A,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            DetailsCaracteristique(title: "Quantité", value: product.quantity ?? ''),
                            const Divider(color: AppColors.gray1, height: 5,),
                            DetailsCaracteristique(title: "Vendu", value: product.manufacturingCountries?.join(',') ?? ''),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBlueButton(libelle: "Végétarien"),
                            AppBlueButton(libelle: "Végétarien", isTrue: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

class DetailsBandeau extends StatelessWidget {
  const DetailsBandeau({super.key, required this.nutriScore, required this.novaScore, required this.ecoScore});
  final ProductNutriscore nutriScore;
  final ProductNovaScore novaScore;
  final ProductEcoScore ecoScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.gray1,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 44,
                  child: ProductNutriscoreWidget(score: nutriScore),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: VerticalDivider(width: 1, color: AppColors.white,),
                ),
                Expanded(
                  flex: 56,
                  child: ProductNovaScoreWidget(score: novaScore),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ProductEcoScoreWidget(score: ecoScore),
          ),
        ],
      ),
    );
  }
}


class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key, required this.name, required this.altName});

  final String name;
  final String altName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
    );
  }
}


class DetailsCaracteristique extends StatelessWidget {
  const DetailsCaracteristique({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blueDark),),
        Text(value, style: const TextStyle(fontSize: 20, color: AppColors.gray3),),
      ],
    );
  }
}

class AppBlueButton extends StatelessWidget {
  const AppBlueButton({super.key, required this.libelle, this.isTrue=true});

  final String libelle;
  final bool isTrue;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        backgroundColor: AppColors.blueLight,
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isTrue ? Icons.check : Icons.cancel),
          const SizedBox(width: 10,),
          Text(libelle),
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
    ProductNovaScore.Group4 => 'Produits alimentaires et boissons ultra-transformés',
  };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Groupe NOVA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark),),
        Text(getText(score), style: const TextStyle(fontSize: 14, color: AppColors.gray3),),
      ],
    );
  }
}

class ProductEcoScoreWidget extends StatelessWidget {
  const ProductEcoScoreWidget({Key? key, required this.score})
      : super(key: key);

  final ProductEcoScore score;

  IconData _findIcon() {
    switch (score) {
      case ProductEcoScore.A:
        return AppIcons.ecoscore_a;
      case ProductEcoScore.B:
        return AppIcons.ecoscore_b;
      case ProductEcoScore.C:
        return AppIcons.ecoscore_c;
      case ProductEcoScore.D:
        return AppIcons.ecoscore_d;
      case ProductEcoScore.E:
        return AppIcons.ecoscore_e;
      default:
        throw Exception('Unknown nova group!');
    }
  }

  Color _findIconColor() {
    switch (score) {
      case ProductEcoScore.A:
        return AppColors.ecoScoreA;
      case ProductEcoScore.B:
        return AppColors.ecoScoreB;
      case ProductEcoScore.C:
        return AppColors.ecoScoreC;
      case ProductEcoScore.D:
        return AppColors.ecoScoreD;
      case ProductEcoScore.E:
        return AppColors.ecoScoreE;
      default:
        throw Exception('Unknown nova group!');
    }
  }

  String getText() {
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
          const Text('EcoScore', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark,),),
          Row(
            children: [
              Icon(
                _findIcon(),
                color: _findIconColor(),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  getText(),
                  style: const TextStyle(
                    color: AppColors.gray2,
                  ),
                ),
              ),
            ],
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nutri-Score', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark),),
        Container(
          width: double.infinity,
          height: 70,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(getImage(score),), fit: BoxFit.fill),
          ),
        ),
      ],
    ) ;
  }
}


