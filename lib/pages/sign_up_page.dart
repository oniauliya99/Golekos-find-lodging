import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FD),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 17),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  style: orderRegular.copyWith(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'Phone or email address',
                      hintStyle: orderRegular.copyWith(fontSize: 20),
                      border: InputBorder.none),
                  onChanged: (value) {},
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 17),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  style: orderRegular.copyWith(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: orderRegular.copyWith(fontSize: 20),
                      border: InputBorder.none),
                  onChanged: (value) {},
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 17),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  style: orderRegular.copyWith(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: orderRegular.copyWith(fontSize: 20),
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
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 130),
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
