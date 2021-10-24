import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/screens/Login.dart';
import 'package:healthcare/screens/Register.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icon.png',
              height: 220,
              width: 220,
            ),
            SizedBox(height: 20,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 200, height: 50),
              child: ElevatedButton(
                onPressed: (){
                  Get.off(RegisterScreen());
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
            SizedBox(height: 20,),
            Text(
                'or',
                style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 200, height: 50),
              child: ElevatedButton(
                onPressed: (){
                  Get.off(LoginScreen());
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
          ],
        ),
      ),
    );
  }
}
