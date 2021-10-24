import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String date;
  final String url;

  NewsCard(this.title,this.desc, this.date, this.url);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Ink.image(
                      image: NetworkImage(url),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                    date,
                  style: TextStyle(
                    fontSize: 12,fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                      title,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                ),
                SizedBox(height: 10,),
                Text(
                  desc,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

