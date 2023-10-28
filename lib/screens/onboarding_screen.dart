import 'package:flutter/material.dart';
import 'package:laza/consts/sizing_config.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final color = Theme.of(context).colorScheme;
    return  Scaffold(backgroundColor: color.primary,
      body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children:[ LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Image.asset(
                    'assets/images/onboarding_image.png',  
                    width: constraints.maxWidth,  
                    height: constraints.maxHeight,  
                  );
                },
              ),
                   Positioned(bottom: 0,
            child: Container(padding: EdgeInsets.only(top:25.0,bottom: 12,left: 12,right: 12),
            width:horizontalConverter(context, 345),
            height: 244,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color.onPrimary
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                 Text(
                                "Look Good, Feel Good",
                                style: TextStyle(
                                  color: color.secondary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
          
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 16.0),
                      child: Text(
                                  "Create your individual & unique style and \n            look amazing everyday.",
                                  style: TextStyle(
                                    color: color.tertiary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                    ), 
          
                     Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 16.0,bottom: 16,left: 50,right: 50)
             
            ),
              onPressed: null,
              child: const Text('Men'),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
          
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 16.0,bottom: 16,left: 50,right: 50),
              primary: Colors.blue,
            ),
              onPressed: () {},
              child: const Text('Women'),
            ),
                       ],
                     ),
          
                 Padding(
                      padding: const EdgeInsets.only(top:25.0,),
                      child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: color.tertiary,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                    ),       
              ],
            ),
                   ))] ),
          ),),
    );
  }
}
