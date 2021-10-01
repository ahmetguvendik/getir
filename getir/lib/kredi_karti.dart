import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KrediKarti extends StatefulWidget{
  @override
  State<KrediKarti> createState() => _SatinAlState();
}

class _SatinAlState extends State<KrediKarti> {
  String secilenValue = listitem.first.toString();

  static final List<String> listitem = [
    "1","2","3","4","5","6","7","8","9","10","11","12"
  ];

  static final List<String> list2 = [
    "2021","2022","2023","2024","2025","2026",
  ];

  String secilenvalue2 = list2.first;

  bool isChecked=false;
  bool isChecked1=false;

  String txt ="Kart Numarası";
  String name = "Adınız ve Soyadınız";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.blue,), onPressed: () {
              Navigator.pop(context);
            },)
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 375,
                    height: 170,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(top:80,right: 200),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.blue,// set border color
                                  width: 3.0),   // set border width
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)), // set rounded corner radius
                            ),
                            child: Text(txt.toString(),maxLines: 1,overflow: TextOverflow.visible,),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:0,right: 200,left: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.blue,// set border color
                                width: 3.0),   // set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), // set rounded corner radius
                          ),
                          child: Text(name.toString(),maxLines: 1,),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Text("AD SOYAD"),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.blue,// set border color
                            width: 3.0),   // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // set rounded corner radius
                      ),
                      child: TextField(
                        maxLength: 18,
                        decoration: InputDecoration(
                          hintText: 'KREDİ KARTI AD SOYAD GİRİNİZ',
                          border: InputBorder.none,
                        ),
                        onChanged: (value){
                          setState(() {
                            name=value;
                          });
                        },
                      ),
                    ),
                    Text("KART NUMARASI"),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.blue,// set border color
                            width: 3.0),   // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // set rounded corner radius
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 19,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'KREDİ KARTI NUMARASINI GİRİNİZ',
                          border: InputBorder.none,
                        ),
                        onChanged: (value){
                          setState(() {
                            txt=value;
                          });
                        },
                      ),
                    ),
                    Row(children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blue,// set border color
                              width: 3.0),   // set border width
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)), // set rounded corner radius
                        ),
                        child: DropdownButton<String>(
                          value: secilenValue,
                          items: listitem.map((item) => DropdownMenuItem<String>(
                              child: Text(item),value: item)).toList(),
                          onChanged: (value){
                            setState(() {
                              this.secilenValue =value!;
                            });

                          },),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blue,// set border color
                              width: 3.0),   // set border width
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)), // set rounded corner radius
                        ),
                        child: DropdownButton<String>(
                          value: secilenvalue2,
                          items: list2.map((item) => DropdownMenuItem<String>(
                              child: Text(item),value: item)).toList(),
                          onChanged: (value){
                            setState(() {
                              this.secilenvalue2 =value!;
                            });

                          },),
                      ),
                      Spacer(),
                      Container(
                        width: 80,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blue,// set border color
                              width: 3.0),   // set border width
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          maxLength: 3,
                          decoration: InputDecoration(
                            hintText: 'CVC',
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],)
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("3D Secure ile Ödemek için")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      },
                    ),
                    Text("Kabul Ediyorum")
                  ],
                ),
                FlatButton(onPressed: (){
                  Fluttertoast.showToast(
                      msg: "SİPARİŞİNİZ BAŞARILI BİR ŞEKİLDE ALINMIŞTIR",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }, child:  Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.blue,// set border color
                        width: 3.0),   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                  ),
                  child: Text("SİPARİŞİ TAMAMLA"),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}