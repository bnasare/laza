import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/widgets/navigation_card.dart';
import 'package:laza/widgets/new_custom_textfield.dart';

import '../widgets/custom_back_button.dart';

void main(List<String> args) {
  runApp(const UserAddressScreen());
}

class UserAddressScreen extends StatelessWidget {
  static const routeName = '/user_address';

  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController nameController=TextEditingController();
    bool _Light =true;

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Address',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600, color:color.secondary),),
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
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
                  verticalLength: 55,
                  horizontalLength: 400,
                  
                       ),
          SizedBox(height: 15,),
                       Row(
                         children: [
                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Country',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                         SizedBox(height: 10,),
                       
                           CustomTextfield(
                               controller: nameController,
                               labelText:'Bangladesh',
                               verticalLength: 55,
                               horizontalLength: 170,
                               
                                    ),
                             ],
                           ),
                       SizedBox(width: 12,),
                       
                                     Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                         SizedBox(height: 10,),
                       
                           CustomTextfield(
                               controller: nameController,
                               labelText:'Sylhet',
                               verticalLength: 55,
                               horizontalLength: 170,
                               
                                    ),
                        ],
                                     ),
                         ],
                       ),
          
                       SizedBox(height: 15,),
          
                        Text('Phone Number',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                
                  CustomTextfield(
                  controller: nameController,
                  labelText:'+880 1453-987533',
                  verticalLength: 55,
                  horizontalLength: 400,
                  
                       ),
          
                         SizedBox(height: 15,),
          
                        Text('Address',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                
                  CustomTextfield(
                  controller: nameController,
                  labelText:'Chhatak, Sunamgonj 12/8AB',
                  verticalLength: 55,
                  horizontalLength: 400,
                  
                       ),
          
                        SizedBox(height: 20,),
          
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('Save as primary address',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                 
                CupertinoSwitch(value: _Light, onChanged: (bool value) 
                {  _Light = value; }),
                        ],
                       ),
          
                     
              ],
            ),
          ) ,

          SizedBox(height: 142,),
     NavigationCard(
                        text: 'Save Address',
                       onTap: (){}),
        ],
      ),
    ),
    );
  }
}
