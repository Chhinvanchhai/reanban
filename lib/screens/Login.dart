import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/utils/h1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text("login screen")),
        body: Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width > 720
              ? MediaQuery.of(context).size.width / 2
              : double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: H1(
                    title: "Login",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: defaultHeight,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                        border: OutlineInputBorder(),
                        hintText: "Username"),
                  ),
                ),
                const SizedBox(
                  height: defaultHeight / 1.5,
                ),
                const SizedBox(
                  height: defaultHeight,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security_outlined),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                        border: OutlineInputBorder(),
                        hintText: "Password"),
                  ),
                ),
                const SizedBox(
                  height: defaultHeight / 1.5,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("/");
                  },
                  child: Container(
                    width: double.infinity,
                    height: defaultHeight,
                    child: Center(
                      child: H1(
                        title: "Submit".toUpperCase(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  children: [
                    Text("Crate new account?"),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    ));
  }
}
