import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laza/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productsList = [];

  List<ProductModel> get getProducts {
    productsList.shuffle();
    return productsList;
  }

  ProductModel findProdById(String productId) {
    return productsList.firstWhere((element) => element.id == productId);
  }

  Future<void> fetchProducts() async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .get()
          .then((QuerySnapshot productSnapshot) {
        print("Number of products: ${productSnapshot.size}");
        productsList.clear();

        for (var element in productSnapshot.docs) {
          productsList.insert(
            0,
            ProductModel(
              id: element.get('id'),
              name: element.get('name'),
              imagePath: element.get('imagePaths')[0],
              price: (element.get('price') as int).toDouble(), // Cast to double
              gender: element.get('category'),
              category: element.get('brand'),
              description: element.get('description'),
              productImages: [
                element.get('imagePaths')[1],
                element.get('imagePaths')[2],
                element.get('imagePaths')[3],
                element.get('imagePaths')[4]
              ],
            ),
          );
        }
      });

      notifyListeners();
    } catch (error) {
      print("Error fetching products: $error");
      // You can add additional error handling or log statements here
    }
  }

  List<ProductModel> searchQuery(String searchText) {
    List<ProductModel> searchList = productsList
        .where(
          (element) => element.name.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return searchList;
  }

  // static final List<ProductModel> productsList = [
  //   ProductModel(
  //     id: '1',
  //     imagePath: 'assets/images/products/product_1.png',
  //     name: 'Nike Tech Fleece Full Zip Jacket',
  //     price: 145,
  //     description:
  //         "Blending 2 of our most iconic looks, this full-zip hoodie draws design inspiration from our timeless Windrunner jacket as well as our Tech Fleece jacket. It's designed to feel relaxed through the shoulders, chest and body for an athletic fit you can layer. Our premium, smooth-on-both-sides fleece feels warmer and softer than ever, while keeping the same lightweight build you love.",
  //     gender: 'male',
  //     category: 'nike',
  //     productImages: ['1_1', '1_2', '1_3', '1_4'],
  //   ),
  //   ProductModel(
  //     id: '2',
  //     imagePath: 'assets/images/products/product_2.png',
  //     name: 'Nike Sportswear Club Fleece Pullover Hoodie',
  //     price: 60,
  //     description:
  //         "A closet staple, the Nike Sportswear Club Fleece Pullover Hoodie combines classic style with the soft comfort of fleece.",
  //     gender: 'male',
  //     category: 'nike',
  //     productImages: ['2_1', '2_2', '2_3', '2_4'],
  //   ),
  //   ProductModel(
  //     id: '3',
  //     imagePath: 'assets/images/products/product_3.png',
  //     name: 'Nike Sportswear Club Fleece Mid-Rise Joggers',
  //     price: 60,
  //     description:
  //         "Club Fleece, universally loved for its coziness and consistency, is for everyone. These mid-rise Club Fleece pants have a soft, familiar feel that makes it easy to stay warm and comfortable.",
  //     gender: 'female',
  //     category: 'nike',
  //     productImages: ['3_1', '3_2', '3_3', '3_4'],
  //   ),
  //   ProductModel(
  //     id: '4',
  //     imagePath: 'assets/images/products/product_4.png',
  //     name: 'Nike Sportswear Faux Fur Plush Printed Jacket',
  //     price: 90,
  //     description:
  //         "Reach for this cropped, spacious sweatshirt to keep your look elevated when temperatures drop. Its plush fleece has a thick, wooly feel that keeps you extra warm and cozy even on the coldest of days.",
  //     gender: 'female',
  //     category: 'nike',
  //     productImages: ['4_1', '4_2', '4_3', '4_4'],
  //   ),
  //   ProductModel(
  //     id: '5',
  //     imagePath: 'assets/images/products/product_5.png',
  //     name: "Nike Air Force 1 '07",
  //     price: 115,
  //     description:
  //         "The radiance lives on in the Nike Air Force 1 ’07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.",
  //     gender: 'unisex',
  //     category: 'nike',
  //     productImages: ['5_1', '5_2', '5_3', '5_4'],
  //   ),
  //   ProductModel(
  //     id: '6',
  //     imagePath: 'assets/images/products/product_6.png',
  //     name: "Jordan Sport Jam Warm Up Pants",
  //     price: 100,
  //     description:
  //         "Get dressed, head out, put in work. Made with lightweight woven material, these pants are a modern take on MJ's iconic Wings warmup look.",
  //     gender: 'male',
  //     category: 'jordan',
  //     productImages: ['6_1', '6_2', '6_3', '6_4'],
  //   ),
  //   ProductModel(
  //     id: '7',
  //     imagePath: 'assets/images/products/product_7.png',
  //     name: "Jordan Essentials Men's Fleece Pants",
  //     price: 78,
  //     description:
  //         "Cozy is the name of the game, and what's cozier than Jordan sweats? Complete with puff print holiday-inspired graphics, these fleece pants are ready for the season.",
  //     gender: 'male',
  //     category: 'jordan',
  //     productImages: ['7_1', '7_2', '7_3', '7_4'],
  //   ),
  //   ProductModel(
  //     id: '8',
  //     imagePath: 'assets/images/products/product_8.png',
  //     name: "Jordan Dri-FIT Sport Woven Diamond Shorts",
  //     price: 45,
  //     description:
  //         "Iconic as ever, the Diamond shorts are back. This pair is made of four-way stretch-woven fabric and enhanced with sweat-wicking tech. You'll look and feel fresh—on-court and off-court, from the free throw line to the checkout line.",
  //     gender: 'male',
  //     category: 'jordan',
  //     productImages: ['8_1', '8_2', '8_3', '8_4'],
  //   ),
  //   ProductModel(
  //     id: '9',
  //     imagePath: 'assets/images/products/product_9.png',
  //     name: "Air Jordan 1 Retro High OG",
  //     price: 135,
  //     description:
  //         "Fresh look, familiar feel. Every time the AJ1 gets a remake, you get the classic sneaker in new colors and textures. Premium materials and accents give modern expression to an all-time favorite.",
  //     gender: 'unisex',
  //     category: 'jordan',
  //     productImages: ['9_1', '9_2', '9_3', '9_4'],
  //   ),
  //   ProductModel(
  //     id: '10',
  //     imagePath: 'assets/images/products/product_10.png',
  //     name: "Air Jordan 11 Retro Low 'Legend Blue'",
  //     price: 185,
  //     description:
  //         "MJ debuted the Legend Blue 11 in the 1996 All-Star Game after returning from his first retirement, securing the sneaker's immortality, but that got a heritage update in 2021 with the Air Jordan 11 Low Legend Blue.",
  //     gender: 'male',
  //     category: 'jordan',
  //     productImages: ['10_1', '10_2', '10_3', '10_4'],
  //   ),
  //   ProductModel(
  //     id: '11',
  //     imagePath: 'assets/images/products/product_11.png',
  //     name: "Men's UA Essential Fleece Hoodie",
  //     price: 60,
  //     description:
  //         "Warm-ups aren't just about being comfy before the big game—though this fleece is easily some of the most comfortable you've ever felt—it's about being in the right head space, getting focused, and keeping your body ready.",
  //     gender: 'male',
  //     category: 'ua',
  //     productImages: ['11_1', '11_2', '11_3', '11_4'],
  //   ),
  //   ProductModel(
  //     id: '12',
  //     imagePath: 'assets/images/products/product_12.png',
  //     name: "Men's UA Unstoppable Fleece Joggers",
  //     price: 100,
  //     description:
  //         "The warm-up that can't be stopped. Born from performance with flexible fabric that feels good, breathes easily, and moves with you through every big move—you'll be ready to take the field.",
  //     gender: 'male',
  //     category: 'ua',
  //     productImages: ['12_1', '12_2', '12_3', '12_4'],
  //   ),
  //   ProductModel(
  //     id: '13',
  //     imagePath: 'assets/images/products/product_13.png',
  //     name: "Heritage Oversized V-Neck Pullover",
  //     price: 70,
  //     description:
  //         "V-neck pullover sweatshirt in a relaxed fit. Features center logo framed with elliptical graphic and ribbed cuffs. Part of a collection of pieces inspired by New York's signature street style.",
  //     gender: 'female',
  //     category: 'fila',
  //     productImages: ['13_1', '13_2', '13_3', '13_4'],
  //   ),
  //   ProductModel(
  //     id: '14',
  //     imagePath: 'assets/images/products/product_14.png',
  //     name: "Lorri Velour Hoodie",
  //     price: 72,
  //     description:
  //         "Part of the revived F-Box Collection. A classic silhouette in lux velour.Iconic Everywhere.",
  //     gender: 'female',
  //     category: 'fila',
  //     productImages: ['14_1', '14_2', '14_3', '14_4'],
  //   ),
  //   ProductModel(
  //     id: '15',
  //     imagePath: 'assets/images/products/product_15.png',
  //     name: "PUMA x LAMELO BALL Toxic Basketball Shorts",
  //     price: 70,
  //     description:
  //         "As the disruptive and unique as LaMelo Ball, these MELO x TOXIC shorts will help you get wild on and off the court. With an all-over print that's pure MELO, there is not stopping, no mercy.",
  //     gender: 'male',
  //     category: 'puma',
  //     productImages: ['15_1', '15_2', '15_3', '15_4'],
  //   ),
  //   ProductModel(
  //     id: '16',
  //     imagePath: 'assets/images/products/product_16.png',
  //     name: "PUMA x LAMELO BALL Toxic Long Sleeve Tee",
  //     price: 50,
  //     description:
  //         "As the disruptive and unique as LaMelo Ball, this MELO X TOXIC long sleeve tee will help you get wild on and off the court. With a print that's pure MELO, there is not stopping, no mercy.",
  //     gender: 'male',
  //     category: 'puma',
  //     productImages: ['16_1', '16_2', '16_3', '16_4'],
  //   ),
  //   ProductModel(
  //     id: '17',
  //     imagePath: 'assets/images/products/product_17.png',
  //     name: "Manchester City 23/24 Third Jersey",
  //     price: 140,
  //     description:
  //         "Manchester is buzzing with energy. It’s vibrant, it’s exciting, it’s electric. At the heart of that is Manchester City, a team that’s changing the way soccer is played, coached, and understood. Their 2023/24 Third Kit is powered by the team’s lightning-fast style of play and the atmosphere it creates between the fans, players, and staff. The jersey features an electric spark pattern throughout, along with neon green takes on the club crest and sponsor logos. When you watch City play, you can feel the electricity, and now, you can see it too.",
  //     gender: 'male',
  //     category: 'puma',
  //     productImages: ['17_1', '17_2', '17_3', '17_4'],
  //   ),
  //   ProductModel(
  //     id: '18',
  //     imagePath: 'assets/images/products/product_18.png',
  //     name: "EFS DriRelease Men's Training Tank Top",
  //     price: 40,
  //     description:
  //         "A must-have men’s training tank top for the gym or a run. This tank features ergonomic cut lines and moisture-wicking fabric with breathable mesh inserts to keep you dry and cool.",
  //     gender: 'male',
  //     category: 'puma',
  //     productImages: ['18_1', '18_2', '18_3', '18_4'],
  //   ),
  //   ProductModel(
  //     id: '19',
  //     imagePath: 'assets/images/products/product_19.png',
  //     name: "TIRO 23 LEAGUE PANTS",
  //     price: 30,
  //     description:
  //         "Born for the beautiful game. Part of the Tiro 23 League range, these adidas soccer pants use AEROREADY to channel moisture away from your skin and keep you firing on all cylinders. Ankle zips mean they're easy to slide off when your session is done.",
  //     gender: 'unisex',
  //     category: 'adidas',
  //     productImages: ['19_1', '19_2', '19_3', '19_4'],
  //   ),
  //   ProductModel(
  //     id: '20',
  //     imagePath: 'assets/images/products/product_20.png',
  //     name: "Primegreen Essentials 3-Stripes Track Jacket",
  //     price: 33,
  //     description:
  //         "Dash out the door feeling ready for it all. This track jacket has a slim cut with raglan sleeves for a distraction-free feel while warming up or recovering later on. Side pockets keep a bus pass and music player within reach. This product is made with Primegreen, a series of high-performance recycled materials.",
  //     gender: 'unisex',
  //     category: 'adidas',
  //     productImages: ['20_1', '20_2', '20_3', '20_4'],
  //   ),
  //   ProductModel(
  //     id: '21',
  //     imagePath: 'assets/images/products/product_21.png',
  //     name: "Adicolor Classics SST Track Jacket",
  //     price: 72,
  //     description:
  //         "Adicolor Classics Track Jacket, The classic track jacket, revamped with recycled materials. The heart of adidas Originals, Adicolor is for the purist and the pioneer. It celebrates the power and authenticity of adidas' DNA, and when you slip on this Firebird track jacket, you're doing the same. The iconic look of the classic tracksuit is just the same as the original, but recreated with recycled materials. A show of our love of the ocean, and part of adidas' commitment to help",
  //     gender: 'unisex',
  //     category: 'adidas',
  //     productImages: ['21_1', '21_2', '21_3', '21_4'],
  //   ),
  //   ProductModel(
  //     id: '22',
  //     imagePath: 'assets/images/products/product_22.png',
  //     name: "Essentials 3-Stripes Open Hem Pants",
  //     price: 25,
  //     description:
  //         "Keep Up With Your Fitness Goals In These Comfortable Pants. They're Cut For A Regular Fit And Feature Open Hems And A Drawcord Elastic Waist For A Versatile Fit. Side Pockets Provide A Spot To Stash Your Workout Essentials. Primegreen This Product Is Made With Primegreen, A Series Of High-Performance Recycled Materials.",
  //     gender: 'unisex',
  //     category: 'adidas',
  //     productImages: ['22_1', '22_2', '22_3', '22_4'],
  //   ),
  // ];
}
