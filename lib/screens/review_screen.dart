import 'package:flutter/material.dart';
import 'package:laza/widgets/auth_text_field.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laza/widgets/new_custom_textfield.dart';
import 'package:laza/widgets/navigation_card.dart';
import '../widgets/custom_back_button.dart';

void main(List<String> args) {
  runApp(const ReviewScreen());
}

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review';

  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController nameController =TextEditingController();

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
    
        ),
        centerTitle: true,
        title: Text('Add Review',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: color.secondary),),
      ),

    body: Column( 
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
              Text('Name',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
        
            CustomTextfield(
                controller: nameController,
                labelText:'Type your name',
                verticalLength: 50,
                horizontalLength: 400,
                
                     ),
            SizedBox(height: 30,),
               Text('How was your experience ?',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
               CustomTextfield(
                controller: nameController,
                labelText:'Describe your experience',
                verticalLength: 213,
                horizontalLength: 400,
                
                     ),
            
            SizedBox(height: 20,),
            Text('Star',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('0.0',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                Stack(clipBehavior: Clip.none,
                  children: [
                   Image.asset('assets/images/Rectangle.png',),
                   
                    Positioned(right: 120,
                      child:Image.asset('assets/images/Ellipse.png',), )
                  ],
                ),
                     
                    Text('5.0',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),


              ],
            ),
        
        
            
            
            ],
          ),
        ),
                 SizedBox(height: 157,),
     NavigationCard(
                          text: 'Submit Review',
                         onTap: (){}),
      ],
    ),
    ),
    );
  }
}
