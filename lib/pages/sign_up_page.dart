import 'package:flutter/material.dart';
import 'package:golekos/pages/buttom_bar.dart';
import 'package:golekos/services/auth_services.dart';
import 'package:golekos/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      backgroundColor: Color(0xFFFFAFBFD),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
                height: 110,
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Image.asset("assets/images/golekos_logo.png")),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                'Sign Up',
                style: orderRegular.copyWith(fontSize: 36),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 17),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  controller: email,
                  style: orderRegular.copyWith(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: orderRegular.copyWith(
                        fontSize: 20, color: Color(0x6C383737)),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 17),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  controller: password,
                  obscureText: true,
                  style: orderRegular.copyWith(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: orderRegular.copyWith(
                          fontSize: 20, color: Color(0x6C383737)),
                      border: InputBorder.none),
                  onChanged: (value) {},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'One more step to register an account',
                style: orderRegular.copyWith(fontSize: 15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 10),
              height: 65,
              child: InkWell(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0XFF29D5F8),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Sign up now',
                            style: orderRegular.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  AuthService.signUpWithEmailAndPassword(
                          email.text, password.text)
                      .then((user) {
                    var route = MaterialPageRoute(builder: (_) {
                      return ButtomBar(
                        user: user,
                      );
                    });

                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 110),
              child: Text(
                'You are completely safe',
                style: orderBold.copyWith(fontSize: 15, color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Read Our Terms & Conditions.',
                style: orderRegular.copyWith(
                    fontSize: 15, color: Color(0XFF7041EE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
