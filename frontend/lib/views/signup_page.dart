import 'package:flutter/material.dart';
import 'package:frontend/colors.dart';
import 'package:frontend/views/home_page.dart';
import 'package:frontend/views/login_page.dart';

import '../services/user_api.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _userEmail = TextEditingController();
  final _passWord = TextEditingController();
  final _cnfPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _validateEmail = false;
  bool _validatePass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 55, 18, 50),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 55, 18, 50),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
              },
              icon: const Icon(
                Icons.home,
                size: 20,
                color: Colors.grey,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(221, 128, 17, 128)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _userEmail,
                            validator: (currentValue) {
                              var nonNullValue = currentValue ?? '';
                              if (nonNullValue.isEmpty) {
                                return ("Email is required");
                              }
                              if (!nonNullValue.contains("@")) {
                                return ("Invalid email");
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(221, 248, 106, 106)),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Email',
                              labelText: 'Email',
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: _passWord,
                            obscureText: true,
                            validator: (passCurrentValue) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              var passNonNullValue = passCurrentValue ?? "";
                              if (passNonNullValue.isEmpty) {
                                return ("Password is required");
                              } else if (passNonNullValue.length < 6) {
                                return ("Password Must be more than 5 characters");
                              } else if (!regex.hasMatch(passNonNullValue)) {
                                return ("Password should contain upper, lower, digit and Special character ");
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: _cnfPass,
                            obscureText: true,
                            validator: (String? passCurrentValue) {
                              if (passCurrentValue != null &&
                                  passCurrentValue.isEmpty) {
                                return "Retype Password";
                              }
                              if (passCurrentValue != _passWord.text) {
                                return "Password Doesn't match";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Re-enter Password',
                              labelText: 'Confirm Password',
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_validateEmail == false &&
                                  _validatePass == false) {
                                var res = await UserApi()
                                    .addUser(_userEmail.text, _passWord.text);
                                Navigator.pop(context, res);
                              }
                            } else {
                              _validateEmail = true;
                              _validatePass = true;
                            }
                          },
                          color: const Color.fromARGB(255, 252, 88, 88),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginPage()));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
