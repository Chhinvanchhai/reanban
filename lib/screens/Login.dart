import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/controllers/UserController.dart';
import 'package:reanban/utils/h1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loading = false;
  final UserController userController = Get.put(UserController());
  Map<dynamic, dynamic> data = {"email": "", "password": ""};
  void onLogin() async {
    setState(() {
      loading = true;
    });
    var box = GetStorage();
    var res = await userController.logn(data);
    if (userController.statusCode == 201 || userController.statusCode == 200) {
      // Get.toNamed("/");
      box.write('user', res);
    } else {
      if (userController.statusCode == 500) {
        Get.snackbar(
          "Error",
          "server error",
          duration: Duration(seconds: 3),
        );
        setState(() {
          loading = false;
        });
        return;
      }
      Get.snackbar('Failed', res["messages"][0],
          backgroundColor: Colors.orange);
    }
    setState(() {
      loading = false;
    });
  }

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
                SizedBox(
                  height: defaultHeight,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        data['email'] = value;
                      });
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Text('Username'),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                        border: OutlineInputBorder(),
                        hintText: "Username"),
                  ),
                ),
                const SizedBox(
                  height: defaultHeight / 1.5,
                ),
                SizedBox(
                  height: defaultHeight,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        data['password'] = value;
                      });
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text('Password'),
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
                    onLogin();
                  },
                  child: Container(
                    width: double.infinity,
                    height: defaultHeight,
                    child: Center(
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.red)
                          : H1(
                              title: "Submit".toUpperCase(),
                            ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  children: [
                    const Text("Crate new account?"),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Text(
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
