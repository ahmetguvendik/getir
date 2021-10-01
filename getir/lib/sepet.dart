import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'odeme.dart';

class Sepet extends StatefulWidget {


  @override
  State<Sepet> createState() => _SepetState();
  String bilgi;

  Sepet({required this.bilgi});

}

class _SepetState extends State<Sepet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text("SEPET"),
           centerTitle: true,
           leading: IconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: Icon(Icons.arrow_back)),
         ),
         body: Column(
           children: [
             StreamBuilder(
                 stream: FirebaseFirestore.instance.collection("users").doc(widget.bilgi).collection("sepet").snapshots(),
                 builder: (BuildContext context , AsyncSnapshot async){
                   if(async.hasError){
                     return Center(child: Text("Bir hata Oluştu, Lütfen Daha Sonra Tekrar Deneyiniz"),);
                   }
                 else{
                      if(async.hasData){
                        final  List liste = async.data!.docs;
                        return Flexible(
                            child: ListView.builder(
                                itemCount: liste.length,
                                itemBuilder: (context,index){
                                  toplam(){
                                    num toplam=0;
                                    for(int i=0;i<liste.length;i++){
                                      toplam = toplam + liste[i].data()["price"];
                                    }
                                    return toplam;
                                  }
                                 print(toplam());
                                  return Column(
                                    children: [
                                    Card(
                                    color: Colors.blue,
                                    child: ListTile(
                                      title: Text(liste[index].data()["data"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                      subtitle: Text(liste[index].data()["adet"].toString(),style: TextStyle(color: Colors.white,fontSize: 16),),
                                      leading: Text(liste[index].data()["price"].toString(),style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete,color: Colors.white,),
                                        onPressed: () {
                                          liste[index].reference.delete();
                                        },
                                      ),
                                    ),
                                  ),
                                      Text("TOPLAM BORCUNUZ: "+toplam().toString()),
                                      ElevatedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Odeme(bilgi: widget.bilgi,topla: toplam())));
                                          }, child: Text("SİPARİŞİ TAMAMLA"))
                                    ],
                                  );
                                }));
                      }
                  else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                   }
                 }
             ),

           ],
         ),
       ),
    );
  }
}



