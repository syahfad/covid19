import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/navigator.dart';
import 'Register.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 80,),
                Image.asset(
                  'assets/images/icon.png',
                  height: 220,
                  width: 220,
                ),
                SizedBox(height: 10,),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(19)
                      ),
                      hintText:'email',
                      contentPadding:const EdgeInsets.all(20)
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(19)
                      ),
                      hintText:'password',
                      contentPadding:const EdgeInsets.all(20)
                  ),
                ),
                SizedBox(height: 20,),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200, height: 50),
                  child: ElevatedButton(
                    onPressed: ()async{
                      await _firebaseAuth.signInWithEmailAndPassword(
                          email: _emailController.text, password: _passwordController.text
                          ).then((value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>HomeNavigator())
                      ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff14de94)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dont have account?',
                      style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        'register',
                        style: TextStyle(color: Color(0xff14de94),fontWeight: FontWeight.w600),
                      ),
                    )
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


