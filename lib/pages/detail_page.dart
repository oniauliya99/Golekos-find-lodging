import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/list_user_riview.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final name, type, imageUrl, location;
  final price;
  final bed;
  final bath;
  final kitchen;
  const DetailPage(
      {this.name,
      this.bed,
      this.bath,
      this.kitchen,
      this.location,
      this.type,
      this.price,
      this.imageUrl});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,##0", "en_US");

    String path;
    path = widget.imageUrl;
    return Scaffold(
      backgroundColor: Color(0xffF2F6FD),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 69,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: Column(
                    children: [
                      Text(
                        'Rp ${currencyFormat.format(widget.price) ?? 0}',
                        style: orderMedium.copyWith(
                            fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        "/month",
                        style: orderLight.copyWith(
                            fontSize: 14, color: Color(0xffA5A5A5)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xff29D5F8),
                  child: Text(
                    "BOOKING NOW",
                    style: orderSemiBold.copyWith(
                        fontSize: 24, color: Colors.white),
                  ),
                ),
                onTap: () {
                  print("object");
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(path),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/svg/btn_back.svg',
                          width: 50,
                        ),
                        onPressed: () {
                          print("jalo");
                        }),
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/svg/btn_love.svg',
                          width: 50,
                        ),
                        onPressed: () {
                          print("jalo");
                        }),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 330),
              decoration: BoxDecoration(
                color: Color(0xffF2F6FD),
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name ?? "Product name",
                          style: orderBold.copyWith(fontSize: 24),
                          maxLines: 4,
                        ),
                        Text(widget.location ?? "add",
                            style: orderMedium.copyWith(fontSize: 14),
                            maxLines: 4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.type,
                          style: orderLight.copyWith(
                            fontSize: 16,
                            color: Color(0xffA5A5A5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Room Specs',
                      style: orderBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/double-bed.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          widget.bed.toString(),
                          style: orderSemiBold.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bath.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          widget.bath.toString(),
                          style: orderSemiBold.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/bar-counter.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          widget.kitchen.toString(),
                          style: orderSemiBold.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Master Bed",
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xffA5A5A5)),
                        ),
                        SizedBox(
                          width: 46,
                        ),
                        Text(
                          "Bathrooms",
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xffA5A5A5)),
                        ),
                        SizedBox(
                          width: 46,
                        ),
                        Text(
                          "Kitchen",
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xffA5A5A5)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Happy Tenant",
                      style: orderBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Tenant(),
                    Tenant(),
                    Tenant(),
                    Tenant(),
                    Tenant(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
