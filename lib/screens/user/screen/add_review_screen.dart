import 'package:flutter/material.dart';
import 'package:laza/models/review_model.dart';
import 'package:laza/screens/review_screen.dart';
import 'package:laza/utils/snack_bar.dart';
import 'package:provider/provider.dart';
import '../../../providers/review_provider.dart';
import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/custom_textfield.dart';

class AddReviewScreen extends StatefulWidget {
  static const routeName = '/add_review';

  const AddReviewScreen({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  double sliderValue = 4;

  TextEditingController nameController = TextEditingController();
  TextEditingController describeExperienceController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    describeExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final reviewProvider = Provider.of<ReviewProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Add Review',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: color.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                    child: CustomTextfield(
                      controller: nameController,
                      hintText: 'Type your name',
                      maxLines: 1,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  const Text(
                    'How was your experience ?',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: CustomTextfield(
                      controller: describeExperienceController,
                      hintText: 'Describe your experience',
                      maxLines: 12,
                      contentPadding: const EdgeInsets.only(
                          left: 15, right: 15, top: 30, bottom: 0),
                    ),
                  ),
                  const Text(
                    'Star',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '0.0',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 8.0,
                            trackShape: RoundedRectSliderTrackShape(),
                          ),
                          child: Slider.adaptive(
                            thumbColor: color.primary,
                            inactiveColor: color.background,
                            value: sliderValue,
                            activeColor: color.background,
                            min: 0.0,
                            max: 5.0,
                            divisions: 50,
                            label: sliderValue.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        '5.0',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationCard(
        text: 'Submit Review',
        onTap: () {
          try {
            ReviewModel newReview = ReviewModel(
              name: nameController.text.trim(),
              time: DateTime.now(),
              review: describeExperienceController.text.trim(),
              rating: double.parse(sliderValue.toStringAsFixed(1)),
              productId: widget.productId,
            );
            reviewProvider.submitReview(newReview);
            openSnackbar(context, 'Review added successfully', color.primary);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ReviewScreen(productId: widget.productId);
                },
              ),
            );
          } catch (error) {
            openSnackbar(context, 'An error occurred: $error', color.primary);
          }
        },
      ),
    );
  }
}