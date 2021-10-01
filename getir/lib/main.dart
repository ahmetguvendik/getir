import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getir/detay.dart';
import 'package:getir/uyari.dart';
import 'package:getir/uyegiris.dart';

import 'kayitol.dart';

void main() async{

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.only(top: 50.0,left: 100),
               child: Row(
                 children: [
                   FlatButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> UyeGiris()));
                   }, child: Text("Üye Girişi",style: TextStyle(color: Colors.white) ,),),
                   FlatButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> KayitOl()));
                   }, child: Text("Kayıt Ol",style: TextStyle(color: Colors.white) ,),),
                 ],
               ),
             ),
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
                    Favories(title: "Kuzeyden",price: "2.95 TL",boy: "1.5 L",image:"images/su.jpg",function: (){},detay: "🏀🏐🇹🇷Basketbol Milli Takımlar ve Voleybol Milli Takımlar Resmi Su Sponsoru Kuzeyden.",),
                    Favories(title: "İçim Yağlı Süt",price: "7.95 TL",boy: "1 L",image:"images/süt.jpg" ,function: (){},detay: "Hiçbir katkı maddesi içermez.",),
                    Favories(title: "Barilla Spagetti",price: "7.35 TL",boy: "500 G",image:"images/makarna.jpg" ,function: (){},detay: "Önerilen pişirme süresi 9 dakikadır.",),
                    Favories(title: "Magnum Badem",price: "7.50 TL",boy: "100 ml",image:"images/magnum.jpg" ,function: (){},detay: "Sütlü kıtır çikolata ve badem parçacıklarıyla kaplı kadifemsi vanilya lezzeti",),
                    Favories(title: "Eti Canga",price: "2.85 TL",boy: "45 G",image:"images/canga.jpg" ,function: (){},detay: "ETİ CANGA",),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class Favories extends StatelessWidget {
  String price;
  String title;
  String boy;
  String image;
  String detay;
  Function function;
  Favories({required this.image,required this.title,required this.price,required this.boy,required this.function,required this.detay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Uyari()));
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

              Text(price,style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
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
