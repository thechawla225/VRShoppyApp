import 'package:flutter/material.dart';
import 'package:vrshoppy/Screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:vrshoppy/Screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.purple,
        body: SafeArea(
            child: Container(
          height: size.height,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to VRShoppy",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'ProximaNova'),
                ),
                Container(height: size.height * 0.05),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen("Sign Up")));
                  },
                  child: Container(
                      height: 50,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: const Center(
                          child: Text("Sign Up",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'ProximaNova')) //Text
                          ) //Center
                      ),
                ), //Container
                Container(height: size.height * 0.02),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen("Login")));
                    },
                    child: Container(
                        height: 50,
                        width: size.width * 0.40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))),
                        child: const Center(
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.purple,
                                    fontFamily: 'ProximaNova')) //Text
                            ) //Center
                        )),
              ]),
        )));
  }
}
