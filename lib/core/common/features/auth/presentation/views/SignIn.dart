import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tekDevisalPOS/core/common/features/auth/data/datasource/user_remote_data_source.dart';
import 'package:tekDevisalPOS/core/common/providers/user_controller.dart';
import 'package:tekDevisalPOS/core/common/widgets/responsive_safe_area.dart';
import 'package:tekDevisalPOS/core/extensions/dimension_extensions.dart';
import 'package:tekDevisalPOS/core/utils/colors.dart';
import 'package:tekDevisalPOS/core/utils/constants.dart';
import 'package:tekDevisalPOS/core/utils/functions.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/HomePage.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/i_loader.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const id = '/login';

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _uidController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(50.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: "Quicksand_bold",
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 40),
                      child: const Text(
                        'To sign in, kindly use your username and password to sign in.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Quicksand_regular",
                            fontSize: 15,
                            //fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: "Email"),
                              controller: _uidController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email required';
                                } else if (!value.contains("@")) {
                                  return 'Enter valid email';
                                }
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: "Password"),
                              controller: _passwordController,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"\s\b|\b\s"))
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password required';
                                } else if (value.length < 6) {
                                  return 'Password length must be greater than 6';
                                } else if (value != _passwordController.text) {
                                  return 'Password mismatch';
                                }
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    signInUser(context, _uidController.text,
                                        _passwordController.text);
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const HomePage()),
                                  // );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: TheColors.buttonColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          fontFamily: "Quicksand_bold",
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),
                                  ),
                                )),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
