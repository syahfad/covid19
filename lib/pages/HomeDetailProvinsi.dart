import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeDetailProvinsi extends StatefulWidget {
  const HomeDetailProvinsi({Key? key}) : super(key: key);

  @override
  _HomeDetailProvinsiState createState() => _HomeDetailProvinsiState();
}

class _HomeDetailProvinsiState extends State<HomeDetailProvinsi> {
  final String url = "https://api.kawalcorona.com/indonesia/provinsi";
  List? data = [];
  @override
  void initState() {
    _getRefreshData();
    super.initState();
  }

  Future<void> _getRefreshData()async{
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context)async{
    var response = await http.get(Uri.parse(url),headers:{"Accept":"application/json" });
    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Provinsi di Indonesia',
            style: TextStyle(color: Colors.black,fontSize: 20),
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: ListView.builder(
            itemCount: data!.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data![index]['attributes']['Provinsi'].toString() ,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Text(
                              'Positive : '
                          ),
                          Text(
                            data![index]['attributes']['Kasus_Posi'].toString() ,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 5,),
                      Row(
                          children: <Widget>[
                            Text(
                                'Recovered : '
                            ),
                            Text(
                              data![index]['attributes']['Kasus_Semb'].toString() ,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green
                              ),
                            ),
                          ]
                      ),
                      SizedBox(height: 5,),
                      Row(
                          children: <Widget>[
                            Text(
                                'Deaths : '
                            ),
                            Text(
                              data![index]['attributes']['Kasus_Meni'].toString() ,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}


