import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/screens/Start.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/Login.dart';

class Account extends StatelessWidget {

  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Center(
            child: Text(
              'About Me',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20,),
          Center(child: Image.asset('assets/images/profile.png')),
          SizedBox(height: 20,),
          Center(
            child: Text.rich(
              TextSpan(
                  text:auth.currentUser!.email,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Social Media',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/instagram.png",
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: Text(
                            'Instagram',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onTap: () async{
                            await openUrl('https://www.instagram.com/syahfads/');
                          },
                        )),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/facebook.png",
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: Text(
                            'Facebook',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onTap: () async{
                            await openUrl('https://www.facebook.com/fadhillah77/');
                          },
                        )),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/twitter.png",
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: Text(
                            'Twitter',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onTap: () async{
                            await openUrl('https://twitter.com/syahfads');
                          },
                        )),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  'Portofolio',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/linkedin.png",
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: Text(
                            'Linkedln',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onTap: () async{
                            await openUrl('https://www.linkedin.com/in/m-syahril-fadhillah-359265151/');
                          },
                        )),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/github.png",
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: Text(
                            'Github',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onTap: () async{
                            await openUrl('https://github.com/syahfad');
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                _signOut().then((value)=>Get.offAll(Start()));
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white,fontSize: 18),

              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff14DE94)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future <void> openUrl(String url,{
  bool forceWebView = false, bool enabledJavaScript = false}) async{
  await launch(url);
}


