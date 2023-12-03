import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:laza/screens/user/screen/add_review_screen.dart';
import 'package:laza/screens/reviews/widgets/review_card.dart';
import 'package:laza/widgets/empty_widget.dart';
import 'package:laza/screens/reviews/widgets/rating_widget.dart';
import 'package:provider/provider.dart';
import '../../../models/review_model.dart';
import '../../../providers/review_provider.dart';
import '../../../widgets/custom icons/custom_back_button.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review';

  const ReviewScreen({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final reviewProvider = Provider.of<ReviewProvider>(context);
    reviewProvider.getReviews(productId);
    final List<ReviewModel> reviews = reviewProvider.reviews;
    double averageReviews = getAverageReviews(reviews);

    return reviews.isNotEmpty
        ? Scaffold(
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
                      '${reviews.length} Reviews',
                      style: TextStyle(
                        color: color.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '$averageReviews',
                          style: TextStyle(
                              color: color.secondary,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        RatingDisplay(rating: averageReviews),
                      ],
                    ),
                    trailing: SizedBox(
                      width: horizontalConverter(context, 125),
                      height: verticalConverter(context, 37),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AddReviewScreen(
                                  productId: productId,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 112, 67, 1),
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
                      scrollDirection: Axis.vertical,
                      itemCount: reviews.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5.0),
                      itemBuilder: (context, index) {
                        return ReviewCard(
                          name: reviews[index].name,
                          rating: reviews[index].rating,
                          time: reviews[index].time,
                          review: reviews[index].review,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : EmptyScreen(
            title: 'There are no reviews for this product yet',
            subtitle: 'Click the button below to add a review',
            buttonText: 'Add a review',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddReviewScreen(
                      productId: productId,
                    );
                  },
                ),
              );
            },
          );
  }

  static double getAverageReviews(List<ReviewModel> reviews) {
    double sum = 0;
    for (ReviewModel review in reviews) {
      double rating = review.rating;
      sum += rating;
    }
    double average = sum / reviews.length;
    return double.parse(average.toStringAsFixed(2));
  }
}
