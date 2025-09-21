import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/loginShapesBg.png"),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log In',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  'Please sign in to your existing account',
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                Positioned(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "EMAIL",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'EMAIL',
                                filled: true,
                                fillColor: Color(0x32343E),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "PASSWORD",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                filled: true,
                                fillColor: Color(0x32343E),
                                suffixIcon: Icon(Icons.visibility),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: Text(
                              'LOG IN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Don\'t have an account? SIGN UP',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                          Text("Or", style: TextStyle(color: Colors.grey)),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/facebook.png"),
                              Image.asset("assets/twitter.png"),
                              Image.asset("assets/apple.png"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
