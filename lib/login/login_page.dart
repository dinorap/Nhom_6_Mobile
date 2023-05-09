import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/login/singup_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'ForgotPasswordPage.dart';
import 'auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signup.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(height: h*0.1,),
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 60,
                    backgroundImage: AssetImage("assets/PngItem_4855093.png"),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  children: [
                    Text("Weather App",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("sign into your account",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        )),
                    SizedBox(height: 50),
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
                        controller: emailController,
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
                    SizedBox(height: 20),
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
                          ]),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText, // ẩn mk
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password,color: Colors.deepOrange,),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // màu đường viền khi ấn vào textfield
                                width: 1.0, //độ dày đường viền
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // màu đường viền khi ấn vào textfield
                                width: 1.0, //độ dày đường viền
                              )),
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        RichText(
                            text: TextSpan(
                              text: "forgot your password",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => ForgotPasswordPage()),
                            )),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                  AuthController.instance.login(email, password);
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.09,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/loginbtn.png"),
                      fit: BoxFit.cover,
                    )),
                child: Center(
                  child: Text("Sign in",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(height: 60),
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                    children: [
                  TextSpan(
                    text: " Create",
                    style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage()),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
