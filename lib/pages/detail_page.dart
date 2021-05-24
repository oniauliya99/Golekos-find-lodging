import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FD),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 420,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/pic2.png'),
              ),
            ),
          ),
          ListView(
            // padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 350,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Color(0xffF2F6FD),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
