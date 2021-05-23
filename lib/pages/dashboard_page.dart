import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                              style: GoogleFonts.poppins(fontSize: 22),
                            ),
                            Text(
                              "Shayna Far",
                              style: GoogleFonts.poppins(
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
            )
          ],
        ),
      ),
    );
  }
}
