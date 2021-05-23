import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/list_boarding_houses.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6FD),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // Custom App Bar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // hamburger bar
                    SvgPicture.asset('assets/svg/Icon_menu_outline.svg'),
                    Container(
                        margin: EdgeInsets.only(right: 98, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: orderRegular.copyWith(fontSize: 22),
                            ),
                            Text(
                              "Shayna Far",
                              style: orderBold.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    // image user
                    Container(
                      margin: EdgeInsets.only(top: 19),
                      height: 69,
                      width: 69,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/user_pic.png'),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 32),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find your next kos",
                        hintStyle: orderLight.copyWith(
                            color: Color(0xffA5A5A5), fontSize: 16),
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 97,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tips.png'),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 19, top: 29, right: 10),
              child: Text(
                "Most People Go",
                style: orderBold.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            BoardingHouses(),
            BoardingHouses(),
            BoardingHouses(),
            BoardingHouses(),
          ],
        ),
      ),
    );
  }
}
