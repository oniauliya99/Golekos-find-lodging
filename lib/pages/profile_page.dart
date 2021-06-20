import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golekos/services/db_services.dart';
import 'package:golekos/theme.dart';
import '../widgets/card_tile.dart';
import '../models/product.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile([this.user]);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Navigation bar

    var navigation = Column(
      children: [
        SizedBox(
          height: 190,
        ),

        // White background

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF3F4F8),
            ),
          ),
        ),
      ],
    );

    // Profile Section

    var profileSection = Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/man.png'),
                backgroundColor: Colors.transparent,
                radius: 30,
              ),
              transform: Matrix4.translationValues(0, -50, 0),
              width: 100,
              height: 100,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 62,
              ),
              Text(
                widget.user?.email ?? 'Guest',
                style: orderSemiBold.copyWith(
                    fontSize: 20, color: Color(0xff000000)),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Mahasiswa',
                style: orderRegular.copyWith(color: Color(0xff858496)),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ],
          ),
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );

    // Transaction Section

    var transactionSection = [
      SizedBox(
        height: 90,
      ),

      // Profile section
      profileSection,

      SizedBox(
        height: 50,
      ),

      // Transaction section

      SizedBox(
        height: 20,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction',
                style: orderSemiBold.copyWith(
                    fontSize: 16, color: Color(0xff000000)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: DatabaseServices.orderStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snap) {
                    if (snap.hasError) {
                      return Center(
                        child:
                            Text('Failed to load transaction data, try again'),
                      );
                    }

                    if (snap.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Loading..'),
                            SizedBox(
                              height: 16,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }

                    if (snap.hasData) {
                      return ListView(
                        shrinkWrap: true,
                        children: snap.data.docs.map((DocumentSnapshot doc) {
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;

                          return CardTile(object: data);
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: Text('No data here'),
                      );
                    }
                  },
                ),
              )),
            ],
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xff29D5F8),
      body: SafeArea(
        child: Stack(
          children: [
            // Navigation bar - First layer
            navigation,

            // Profile and Transaction - Second layer
            Column(
              children: transactionSection,
            ),
          ],
        ),
      ),
    );
  }

  Image socialButton(String imgUrl) {
    return Image.asset(
      imgUrl,
      width: 40,
      height: 40,
    );
  }
}
