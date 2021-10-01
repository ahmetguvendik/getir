import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getir/yenianasayfa.dart';

 int count=1;
class Detay extends StatefulWidget {
    String title;
    String images;
    String boy;
    double price;
    String detay;
    String bilgi;

   Detay({required this.title,required this.images,required this.boy,required this.price,required this.detay,required this.bilgi});

  @override
  State<Detay> createState() => _DetayState();
}
class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.title),
          leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(widget.images,width: 150,height: 150,),
                SizedBox(height: 20,),
                Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.price.toString(),style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.detay),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("ADET => ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Text(count.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            OutlinedButton(onPressed: (){
                              setState(() {
                                count++;
                              });
                            }, child: Icon(Icons.plus_one)),
                            OutlinedButton(onPressed: (){
                              setState(() {
                                count--;
                              });
                            }, child: Icon(Icons.exposure_neg_1))
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Column(children: [
                      FlatButton(onPressed: ()async{
                        await FirebaseFirestore.instance.collection("users").doc(widget.bilgi).collection("sepet").doc(widget.title).set(
                            {"data": widget.title,
                              "adet": count,
                              "price": widget.price * count},);
                          },child: Text("SEPETE EKLE"),),
                      Text(widget.price.toString(),style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),)
                    ],)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
