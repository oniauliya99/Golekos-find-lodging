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
          ],
        ),
      ),
    );
  }
}
