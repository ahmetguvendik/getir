import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:getir/main.dart';
import 'package:getir/sepet.dart';

import 'detay.dart';

class YeniAnaSayfa extends StatelessWidget {
  String bilgi;
  YeniAnaSayfa({required this.bilgi});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut().whenComplete(() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MyApp()), (route) => false));
            },
            icon: Icon(Icons.follow_the_signs_outlined),),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sepet(bilgi: bilgi)));
              }, icon: Icon(Icons.shopping_basket))
            ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Hoşgeldin "+ bilgi.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Katagoriler",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Catagories(onTap: (){print("YENİ ÜRÜNLER");},text: "YENİ ÜRÜNLER",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("İNDİRİMLER");},text: "İNDİRİMLER",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("asfasfa");},text: "SU & İÇECEK",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("asfasfa");},text: "MEYVE & SEBZE",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("asfasfa");},text: "FIRINDAN",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("asfasfa");},text: "TEMEL GIDA",icon: Icons.food_bank ,),
                  Catagories(onTap: (){print("asfasfa");},text: "ATIŞTIRMALIK",icon: Icons.food_bank ,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Favoriler",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Favories(title: "Kuzeydan",price: 2.95,boy: "1.5 L",image:"images/su.jpg",detay: "🏀🏐🇹🇷Basketbol Milli Takımlar ve Voleybol Milli Takımlar Resmi Su Sponsoru Kuzeyden.",bilgi: bilgi),
                  Favories(title: "İçim Yağlı Süt",price: 7.95,boy: "1 L",image:"images/süt.jpg" ,detay: "Hiçbir katkı maddesi içermez.",bilgi: bilgi),
                  Favories(title: "Barilla Spagetti",price: 7.35,boy: "500 G",image:"images/makarna.jpg" ,detay: "Önerilen pişirme süresi 9 dakikadır.",bilgi: bilgi),
                  Favories(title: "Magnum Badem",price: 7.55,boy: "100 ml",image:"images/magnum.jpg" ,detay: "Sütlü kıtır çikolata ve badem parçacıklarıyla kaplı kadifemsi vanilya lezzeti",bilgi: bilgi),
                  Favories(title: "Eti Canga",price: 2.85,boy: "45 G",image:"images/canga.jpg" ,detay: "ETİ CANGA",bilgi: bilgi),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Favories extends StatelessWidget {
  double price;
  String title;
  String boy;
  String image;
  String detay;
  String bilgi;
  Favories({required this.image,required this.title,required this.price,required this.boy,required this.detay,required this.bilgi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Detay(title: title,images: image,price: price,boy: boy,detay: detay, bilgi: bilgi,)));
        },
        child: Container(
          height: 250,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10,),
              Image.asset(image,width: 50,height: 120,),

              Text(price.toString(),style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
              Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
              Text(boy,style: TextStyle(color: Colors.grey) ,),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}

class Catagories extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  Catagories({required this.icon,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap:(){
              onTap();
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13))
              ),
              child: Icon(icon),
            ),
          ),
        ),
        Text(text)
      ],
    );
  }
}
