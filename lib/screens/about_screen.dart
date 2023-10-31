import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AboutDev extends StatelessWidget {
  static const routeName = '/AboutDev';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const Drawers(),
      appBar: AppBar(
        title: Text('Information Page', style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children:  [
          const Text(
            'Find cooking classes and tutorials to improve your culinary skills.', 
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(children:  [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/sumer.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                                  ),
                  ),
              const Center(child: Text('Devloper info-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,),),),
              const Center(child: Text('Name : Sumer Choudhary'),),
              const Center(child: Text('Number : 8890349935'),),
              const Center(child: Text('Email : sumerchoudhary493@gmail.com'),),
              Center(child: TextButton(onPressed: (){},child: const Text('Telegram support'), )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              
            ],),
            ),
            const Center(child: Text('Devloper info-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,),),),
            const Center(child: Text('Name : Prabal Pratap'),),
            const Center(child: Text('Number : 7251873174'),),
            const Center(child: Text('Email : prabal493@gmail.com'),),
            Center(child: TextButton(onPressed: (){},child: const Text('Telegram support'), )),
            
        ]),
      ),
      
    );
  }
}