import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/profile_tab.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile([this.user]);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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

      TabBar(
        controller: tabController,
        labelColor: Color(0xff312651),
        unselectedLabelColor: Color(0xff858496),
        tabs: [
          Tab(
            child: Text(
              'My Transaction(2)',
              style: orderSemiBold.copyWith(fontSize: 16),
            ),
          ),
          Tab(
            child: Text(
              'My Reviews(9)',
              style: orderSemiBold.copyWith(fontSize: 16),
            ),
          ),
        ],
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: Color(0xff312651), width: 4, style: BorderStyle.solid)),
      ),
      SizedBox(
        height: 20,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(30),
          child: TabBarView(
            controller: tabController,
            children: [
              ProfileTab('Transaction',
                  title: 'Blue Fast',
                  subTitle: 'Purchase | 18 Jul 2020',
                  note: 'IDR 99.000',
                  imgUrl: 'assets/images/pic.png'),
              ProfileTab('Reviews',
                  title: 'Blue F.. Reviews',
                  subTitle: 'Hi, nice to meet you',
                  note: 'Months Ago',
                  imgUrl: 'assets/images/pic.png'),
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

    // MAIN
    // TODO: Create Backend for Profile and Transaction

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
