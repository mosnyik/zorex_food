import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/helpers/screen_navigation.dart';
import 'package:zorex_food/scr/providers/auth.dart';
import 'package:zorex_food/scr/screens/home.dart';
import 'package:zorex_food/scr/screens/login.dart';
import 'package:zorex_food/scr/widgets/custom_text.dart';
import 'package:zorex_food/scr/widgets/loading.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: 140,
                          height: 140,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: teal),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Colors.teal[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: teal),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Colors.teal[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: teal),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.teal[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signUp()) {
                          _key.currentState.showBottomSheet(
                              (context) => Text('Registertion Failed'));
                          return;
                        }
                        authProvider.clearControllers();
                        changeScreenReplacement(context, Home());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Register',
                                  color: Colors.grey[200],
                                  size: 22,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(
                        context,
                        LoginScreen(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Login here',
                          size: 20,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
