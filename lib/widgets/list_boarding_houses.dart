import 'package:flutter/material.dart';
import '../theme.dart';

class BoardingHouses extends StatelessWidget {
  const BoardingHouses({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 110,
        margin: EdgeInsets.only(bottom: 11, left: 16, right: 16),
        padding: EdgeInsets.only(left: 14, top: 12, bottom: 12, right: 10),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pic.png'),
                    ),
                  ),
                ),
                SizedBox(width: 19),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fukko Cozy",
                      style: orderRegular.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Umum",
                      style: orderLight.copyWith(
                          fontSize: 12,
                          color: Color(0xffA5A5A5),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$55",
                      style: orderRegular.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "/month",
                      style: orderLight.copyWith(
                          fontSize: 12,
                          color: Color(0xffA5A5A5),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
