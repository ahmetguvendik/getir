import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'kredi_karti.dart';

class Odeme extends StatefulWidget {
String bilgi;
num topla;


Odeme({required this.bilgi,required this.topla});

  @override
  State<Odeme> createState() => _OdemeState();
}

class _OdemeState extends State<Odeme> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.blue,)),
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
                      return Flexible(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context,index){
                                return Container(
                                  color: Colors.blue,
                                  child: ListTile(
                                    title: Center(child: Text("TOPLAM TUTAR: "+widget.topla.toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                  ),
                                );
                              }));
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }
                }
            ),
          Flexible(child: Text("ÖDEME YÖNTEMİNİ SEÇİNİZ")), 
            Flexible(
              child: DropdownButton<String>(
                focusColor:Colors.white,
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor:Colors.black,
                items: <String>[
                  'Kredi Kartı',
                  'Nakit',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style:TextStyle(color:Colors.black),),
                  );
                }).toList(),
                hint:Text(
                  "ÖDEME YÖNTEMLERİ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value;
                    if(_chosenValue=="Nakit"){
                      Fluttertoast.showToast(
                          msg: "SİPARİŞİNİZ BAŞARILI BİR ŞEKİLDE ALINMIŞTIR",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>KrediKarti()));
                    }
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
