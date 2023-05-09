import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/login/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../ui/home_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController compasswordController = TextEditingController();
  List images = ["assets/g.png", "assets/t.png", "assets/f.png"];
  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    compasswordController.dispose();
    super.dispose();
  }

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
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  children: [
                    Text(
                      "Create an account to use our service",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
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
                        ],
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
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
                          hintText: 'Enter your password',
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
                        ],
                      ),
                      child: TextField(
                        controller: compasswordController,
                        obscureText: _obscureText,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
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
                          hintText: 'Confirm your password',
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            GestureDetector(

              // Existing code for the register button

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
                  child: Text("Sign up",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
              onTap: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = compasswordController.text.trim();

                if (password == confirmPassword) {
                  AuthController.instance.register(email, password);
                } else {
                  Get.snackbar(
                    "Password incorrect",
                    "Please re-enter your password",
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 3),
                    titleText: Text(
                      "Password incorrect",
                      style: TextStyle(color: Colors.white),
                    ),
                    messageText: Text(
                      "Please re-enter your password",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

              },
            ),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              text: " Have an account ? ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.to(() => LoginPage()),
            )),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                    children: []
                )
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      // Đăng nhập bằng Google khi chọn ảnh đầu tiên
                      if (index == 0) {
                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
                        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                        final AuthCredential credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );
                        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                        final User? user = userCredential.user;
                        Get.offAll(() => HomePage(email: user!.email ?? ''));
                      } else {
                        // Xử lý các phương thức đăng nhập khác ở đây
                      }
                    },
                    child: CircleAvatar(
                      radius: 27,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(images[index]),
                      ),
                    ),
                  ),
                );
              }),
            ),

            // Text(
            //   "Sing up using one of the following methods",
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.grey[700],
            //   ),
            // ),


          ],
        ),
      ),
    );
  }
}
