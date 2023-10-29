import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:laza/screens/user/screen/add_review_screen.dart';
import 'package:laza/widgets/cards/review_card.dart';

import '../widgets/custom icons/custom_back_button.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review';

  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        title: Text(
          'Reviews',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: color.secondary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalConverter(context, 5),
          horizontal: horizontalConverter(context, 3),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '245 Reviews',
                style: TextStyle(
                    color: color.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Row(
                children: [
                  Text(
                    '4.8',
                    style: TextStyle(
                        color: color.secondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  Icon(
                    Icons.star,
                    size: 13,
                    color: color.onTertiary,
                  ),
                  Icon(
                    Icons.star,
                    size: 13,
                    color: color.onTertiary,
                  ),
                  Icon(
                    Icons.star,
                    size: 13,
                    color: color.onTertiary,
                  ),
                  Icon(
                    Icons.star,
                    size: 13,
                    color: color.onTertiary,
                  ),
                  const Icon(Icons.star_outline, size: 13),
                ],
              ),
              trailing: SizedBox(
                width: horizontalConverter(context, 125),
                height: verticalConverter(context, 37),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddReviewScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 112, 67, 1),
                    foregroundColor: color.onPrimary,
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyLight.edit,
                        size: 15,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Add Review',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 5.0),
                itemBuilder: (context, index) {
                  return ReviewCard(
                    name: reviews[index]['name'].toString(),
                    assetName: reviews[index]['assetName'].toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const reviews = [
    {'name': 'Jenny Wilson', 'assetName': 'face_1'},
    {'name': 'Ronald Richards', 'assetName': 'face_3'},
    {'name': 'Guy Hawkins', 'assetName': 'face_4'},
    {'name': 'Savannah Nguyen', 'assetName': 'face_2'},
  ];
}
