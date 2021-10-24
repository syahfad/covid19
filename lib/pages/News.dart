import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/card/News.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('berita');
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title: Text('News',style: TextStyle(color: Colors.black,fontSize: 30),), ),

      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (_,snapshot){
            if(snapshot.hasData){
              return Column(
                children: snapshot.data!.docs.map((e) => NewsCard(e.data()['title'], e.data()['desc'],e.data()['date'],e.data()['image'])).toList()
              );
            }else{
              return Text("loading");
            }
          }
        ),
      ),
    );
  }
}