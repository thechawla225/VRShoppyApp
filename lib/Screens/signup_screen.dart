import 'package:flutter/material.dart';

import 'package:vrshoppy/Screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  final String text;
  const SignUpScreen(this.text, {Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color white = Colors.white;
  String? username;
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      Text(
                        widget.text,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w500),
                      ),
                      Container(height: size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: size.height * 0.05),
                                TextFormField(
                                  style: TextStyle(color: white),
                                  onSaved: (value) => setState(
                                      () => username = value.toString()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter valid username before saving";
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: white,
                                  decoration: InputDecoration(
                                    fillColor: white,
                                    hintText: "Username",
                                    hintStyle:
                                        TextStyle(fontSize: 19, color: white),
                                    errorStyle: TextStyle(color: white),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  style: TextStyle(color: white),
                                  onSaved: (value) => setState(
                                      () => username = value.toString()),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 7) {
                                      return "Please enter more than 10 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: white,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(fontSize: 19, color: white),
                                    errorStyle: TextStyle(color: white),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: white),
                                    ),
                                  ),
                                ),
                                Container(height: size.height * 0.04),
                                GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      }
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
                                                const BorderRadius.all(
                                                    Radius.circular(25))),
                                        child: const Center(
                                            child: Text("Continue",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.purple,
                                                    fontFamily:
                                                        'ProximaNova')) //Text
                                            ) //Center
                                        )),
                              ]),
                        ),
                      ),
                    ]))));
  }
}
