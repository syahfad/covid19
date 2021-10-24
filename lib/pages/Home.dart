import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/model/data_indonesia.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'HomeDetailGlobal.dart';
import 'HomeDetailProvinsi.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future <List<DataIndonesia>> getUserDataIndonesia() async{
    var response = await http.get(Uri.https('api.kawalcorona.com', 'indonesia'));
    var jsonData = jsonDecode(response.body);
    List<DataIndonesia> users = [];

    for(var u in jsonData){
      DataIndonesia user = DataIndonesia(u['name'],u['positif'],u['sembuh'],u['meninggal']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/covid19.png',height: 140,width: 140,),
        backgroundColor: Colors.white,
      ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Card(
              child: FutureBuilder<List<DataIndonesia>>(
                future: getUserDataIndonesia(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Text("Loading"),
                    );
                  }else{
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.date_range,
                                    color: Colors.green,),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.normal,color: Colors.green
                                      ),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Country',
                                  style: TextStyle(
                                    fontSize: 15
                                  ),
                                ),
                                Text(
                                    snapshot.data![i].name,
                                    style: TextStyle(
                                      fontSize: 20
                                    ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Confirmed',
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                                Text(
                                  snapshot.data![i].positif,
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Recovered',
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                                Text(
                                  snapshot.data![i].sembuh,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Deaths',
                                  style: TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                                Text(
                                  snapshot.data![i].meninggal,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Kasus Corona',
                                          style: TextStyle(
                                            fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          'Kasus Corona di Provinsi Indonesia',
                                          style: TextStyle(
                                            fontSize: 13,color: Colors.red
                                          ),
                                        )
                                      ],
                                    ),
                                  GestureDetector(
                                      child: Icon(Icons.arrow_forward_ios),
                                      onTap: (){
                                        Get.to(HomeDetailProvinsi());
                                      },
                                  ),
                                  ]
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Corona Global',
                                              style: TextStyle(
                                                  fontSize: 15
                                              ),
                                            ),
                                            Text(
                                              'Kasus Corona di Dunia',
                                              style: TextStyle(
                                                  fontSize: 13,color: Colors.red
                                              ),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          child: Icon(Icons.arrow_forward_ios),
                                          onTap: (){
                                            Get.to(HomeDetailGlobal());
                                          },
                                        ),
                                      ]
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(height: 20,),
                                Text(
                                    'Spread of Corona Virus',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                                SizedBox(height: 50,),
                                Image.asset("assets/images/map.png")
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ),
        ));
  }
}