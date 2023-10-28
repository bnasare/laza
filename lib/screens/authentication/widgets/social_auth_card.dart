import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthCard extends StatelessWidget {
  const SocialAuthCard(
      {super.key,
      required this.cardColor,
      required this.text,
      required this.image,
      required this.onTap});
  final Color cardColor;
  final String text;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: cardColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset(image),
              ),
              Text(
                text,
                style: TextStyle(
                  color: color.onPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Text',
                  letterSpacing: -0.41,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
