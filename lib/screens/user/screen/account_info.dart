import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laza/widgets/custom%20icons/custom_back_button.dart';

class AccountInfo extends StatelessWidget {
  static const routeName = '/account_info';
  AccountInfo({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

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
          'User',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: color.secondary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Center(
                  child: CircleAvatar(
                radius: 50,
                child: Image.network(
                  user?.photoURL ??
                      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541',
                  fit: BoxFit.contain,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: color.primary,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background),
                    child: Center(
                      child: Text(
                        user?.displayName ?? 'Username',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: color.tertiary),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 215,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background),
                    child: Center(
                      child: Text(
                        user?.email ?? 'Email',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: color.tertiary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 10),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background),
                    child: Center(
                      child: Text(
                        user?.phoneNumber ?? '02X XXX XXXX',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: color.tertiary),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      user?.metadata.toString() ?? 'User Metadata',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, height: 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
