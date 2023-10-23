import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/widgets/navigation_card.dart';
import 'package:laza/widgets/new_custom_textfield.dart';

import '../widgets/custom_back_button.dart';


class PaymentDetailsScreen extends StatelessWidget {
  static const routeName = '/payment_details';

  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController OwnerController = TextEditingController();
    TextEditingController CardNumberController = TextEditingController();
     TextEditingController ExpController = TextEditingController();
      TextEditingController CvvController = TextEditingController();
      bool _Light =true;

      @override
      void dispose(){
        OwnerController.dispose();
        CardNumberController.dispose();
        ExpController.dispose();
        CvvController.dispose();
      }

    return   Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Payment',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: color.secondary),),
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom:0,left: 20),
                  child: Container(height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                    
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ClipRRect(borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/debitCard 2.jpg",width: 300,height:185 ,)),
                          ),
                  
                            ClipRRect(borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/images/debit Card.png",width: 300,height:185 ,)),
                       
                         
                        ],
                      ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top:20.0,right: 20.0,left: 20.0,bottom: 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                                      height:50 ,width:double.infinity ,
                                      decoration: BoxDecoration(color: Color(0xffF6F2FF),
                                        border: Border.all(
                                          width: 1,
                                          color: color.primary
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Container(height: 15,width: 15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(
                        color:color.primary
                                          )
                                        ),
                                          child:
                          Icon(Icons.add,size: 12,),
                                           ),
                                           SizedBox(
                        width: 10,
                                           ),
                                           
                          Text('Add new card',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: color.primary,),)
                                      ],),
                                    ),
                      ) , 
              
              Text(
                  'Card owner',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomTextfield(
                      controller: OwnerController,
                      hintText: 'Mrh Raju',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      maxLines: 1,
                    ),
                  ),
                ),
              
                        Text(
                  'Card Number',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomTextfield(
                      controller: CardNumberController,
                      hintText: '5254 7634 8734 7690',
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
                            'EXP',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextfield(
                            controller: ExpController,
                            hintText: '24/24',
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
                            'CVV',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextfield(
                            controller: CvvController,
                            hintText: '7763',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Save as primary address',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                   
                  CupertinoSwitch(value: _Light, onChanged: (bool value) 
                  {  _Light = value; }),
                          ],
                         ),   
                ],
              
              ),
            ),
               ],
        ),
      ),
      bottomNavigationBar: NavigationCard(
                          text: 'Save Address',
                         onTap: (){}), 
    ) ;
  }
}

