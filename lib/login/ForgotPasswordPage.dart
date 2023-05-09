import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/loginimg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.3),
                  )
                ],
              ),
              child: TextField(
                controller: _emailController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepOrange,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Enter your email',
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                bool resetSuccess = await AuthController.instance.resetPassword(_emailController.text);
                if (resetSuccess) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/loginbtn.png"),
                      fit: BoxFit.cover,
                    )),
                child: Center(
                  child: Text("Reset Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
                  text: " Go back to login page ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => LoginPage()),
                )),
          ],
        ),
      ),
    );
  }
}
