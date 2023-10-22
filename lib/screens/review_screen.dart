import 'package:flutter/material.dart';
import 'package:laza/widgets/navigation_card.dart';
import 'package:laza/widgets/new_custom_textfield.dart';

import '../widgets/custom_back_button.dart';

class ReviewScreen extends StatefulWidget {
  static const routeName = '/review';

  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double sliderValue = 2.5;

    final color = Theme.of(context).colorScheme;
    TextEditingController nameController = TextEditingController();
    TextEditingController describeExperienceController =
        TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              color: color.secondary),
        ),
      ),
      body: Column(
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
                    fixedHeight: 40,
                    controller: nameController,
                    hintText: 'Type your name',
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 15, top: 0, bottom: 0),
                  ),
                ),
                const Text(
                  'How was your experience ?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: CustomTextfield(
                    fixedHeight: 40,
                    controller: describeExperienceController,
                    hintText: 'Describe your experience',
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 0),
                  ),
                ),
                const Text(
                  'Star',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0.0',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Slider(
                        value: sliderValue,
                        min: 0.0,
                        max: 5.0,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      '5.0',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          NavigationCard(text: 'Submit Review', onTap: () {}),
        ],
      ),
    );
  }
}
