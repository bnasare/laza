import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laza/cart/cart_screen.dart';
import 'package:laza/screens/user/widgets/custom_textfield.dart';
import 'package:laza/screens/user/widgets/delivery_address_card.dart';
import 'package:laza/widgets/switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';

class UserAddressScreen extends StatefulWidget {
  static const routeName = '/user_address';

  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isPrimaryAddress = true;

  @override
  void dispose() {
    nameController.dispose();
    countryController.dispose();
    cityController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

final FirebaseAuth _auth = FirebaseAuth.instance;

void saveToCart() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CartScreen(
        city: cityController.text,
        address: addressController.text, // Make sure to add .text here
      ),
    ),
  );
}


void _saveAddress() async {

  User? currentUser = _auth.currentUser;

  if (currentUser != null) {
    final uid = currentUser.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'telephone': phoneController.text,
      'address': addressController.text,
      'city': cityController.text,
    });
  } else {
    print('User is not signed in');
  }
}

Future<void> retreive() async {
  User? currentUser = _auth.currentUser;
  final uid = currentUser?.uid;

  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    // Check if the document exists
    if (documentSnapshot.exists) {
      // Now you can access the document field values
      var telephone = documentSnapshot.get('telephone');
      var address = documentSnapshot.get('address');
      var city = documentSnapshot.get('city');

      // Use the retrieved data as needed
      print('Telephone: $telephone, Address: $address, City: $city');
    } else {
      print('Document does not exist for ID: $uid');
    }
  } catch (e) {
    // Handle any potential errors here
    print('Error fetching data: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                    hintText: 'Mrh Raju',
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Save as primary address',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomSwitch(initialState: true)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationCard(
        text: 'Save Address',
        onTap: () {
          _saveAddress();
          retreive();
          saveToCart();
       // Navigator.pop(context);
        },
      ),
    );
  }
}
