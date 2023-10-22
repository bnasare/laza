import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/widgets/new_custom_textfield.dart';

import '../widgets/custom_back_button.dart';
import '../widgets/navigation_card.dart';

class UserAddressScreen extends StatelessWidget {
  static const routeName = '/user_address';

  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController nameController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    bool isPrimaryAddress = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Address',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: color.secondary,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomTextfield(
                    controller: nameController,
                    hintText: 'Type your name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    maxLines: 1,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Country',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: countryController,
                          hintText: 'Bangladesh',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'City',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: cityController,
                          hintText: 'Sylhet',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomTextfield(
                    controller: phoneController,
                    hintText: '+880 1453-987533',
                    maxLines: 1,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
              const Text(
                'Address',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomTextfield(
                    controller: addressController,
                    hintText: 'Chhatak, Sunamgonj 12/8AB',
                    maxLines: 1,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Save as primary address',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CupertinoSwitch(
                    value: isPrimaryAddress,
                    onChanged: (bool value) {
                      isPrimaryAddress = value;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationCard(
        text: 'Save Address',
        onTap: () {},
      ),
    );
  }
}
