import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/screens/Login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
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
                  "Register",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(19)
                      ),
                      hintText:'username',
                      contentPadding:const EdgeInsets.all(20)
                  ),
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
                      await _firebaseAuth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                      );
                      showDialog(context: context, builder: (BuildContext context) {
                        Widget okButton = TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                            Get.off(LoginScreen());
                          },
                        );
                        return new AlertDialog(
                          title: new Text("Register"),
                          content: new Text("Account has been created"),
                          actions: [
                            okButton
                          ],
                        );
                      });
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff146648)),
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        'login',
                        style: TextStyle(color: Color(0xff146648),fontWeight: FontWeight.w600),
                      ),
                    ),

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




