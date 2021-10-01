import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getir/kayitol.dart';
import 'package:getir/uyegiris.dart';

class Uyari extends StatelessWidget {
  const Uyari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.warning,size: 60,)),
                    SizedBox(height: 40,),
                    Text("LÜTFEN ÖNCE ÜYE GİRİŞİ YAPIN",style: TextStyle(fontSize: 24),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UyeGiris()));
                        }, child: Text("ÜYE GİRİŞİ")),
                        SizedBox(width: 20,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>KayitOl()));
                        }, child: Text("KAYIT OL"))
                      ],
                    )
             ],
           ),
         ),
      ),
    );
  }
}
