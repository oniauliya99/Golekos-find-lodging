import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FD),
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: orderRegular.copyWith(fontSize: 28),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/sign_in/logo.png'),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                'Sign in as Guest ',
                                style: orderRegular,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/sign_in/logo.png'),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 80),
                              child: Text(
                                'Sign in with Google ',
                                style:
                                    orderRegular.copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'or get a link emailed to you',
                style: orderRegular.copyWith(fontSize: 11, color: Colors.grey),
              ),
            ),
            new ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                height: 60,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Work email address',
                        hintStyle: orderRegular,
                        border: InputBorder.none),
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
