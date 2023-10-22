import 'package:flutter/material.dart';

import '../widgets/custom_back_button.dart';

class UserAddressScreen extends StatelessWidget {
  static const routeName = '/user_address';

  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController nameController = TextEditingController();
    bool Light = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Address',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: color.secondary),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Text(
      //             'Name',
      //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           CustomTextfield(
      //             controller: nameController,
      //             hintText: 'Type your name',
      //             verticalLength: 55,
      //             horizontalLength: 400,
      //           ),
      //           const SizedBox(
      //             height: 15,
      //           ),
      //           Row(
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   const Text(
      //                     'Country',
      //                     style: TextStyle(
      //                         fontSize: 17, fontWeight: FontWeight.w500),
      //                   ),
      //                   const SizedBox(
      //                     height: 10,
      //                   ),
      //                   CustomTextfield(
      //                     controller: nameController,
      //                     hintText: 'Bangladesh',
      //                     verticalLength: 55,
      //                     horizontalLength: 170,
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 width: 12,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   const Text(
      //                     'City',
      //                     style: TextStyle(
      //                         fontSize: 17, fontWeight: FontWeight.w500),
      //                   ),
      //                   const SizedBox(
      //                     height: 10,
      //                   ),
      //                   CustomTextfield(
      //                     controller: nameController,
      //                     hintText: 'Sylhet',
      //                     verticalLength: 55,
      //                     horizontalLength: 170,
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 15,
      //           ),
      //           const Text(
      //             'Phone Number',
      //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           CustomTextfield(
      //             controller: nameController,
      //             hintText: '+880 1453-987533',
      //             verticalLength: 55,
      //             horizontalLength: 400,
      //           ),
      //           const SizedBox(
      //             height: 15,
      //           ),
      //           const Text(
      //             'Address',
      //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           CustomTextfield(
      //             controller: nameController,
      //             hintText: 'Chhatak, Sunamgonj 12/8AB',
      //             verticalLength: 55,
      //             horizontalLength: 400,
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               const Text(
      //                 'Save as primary address',
      //                 style:
      //                     TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      //               ),
      //               CupertinoSwitch(
      //                   value: Light,
      //                   onChanged: (bool value) {
      //                     Light = value;
      //                   }),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 142,
      //     ),
      //     NavigationCard(text: 'Save Address', onTap: () {}),
      //   ],
      // ),
    );
  }
}
