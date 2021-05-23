import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/order_summary_row.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              children: [
                // Title Order Section

                AppBar(
                  centerTitle: true,
                  title: Text(
                    'ORDER #12345678',
                    style: orderBold.copyWith(color: orderBlack),
                  ),
                  leading: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: orderGrey,
                    ),
                    onPressed: () {},
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),

                SizedBox(
                  height: 35,
                ),

                // Order Summary Section

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order summary',
                        style: orderBold.copyWith(color: orderBlack),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Kost image and details

                      Row(
                        children: [
                          Image.asset(
                            'assets/images/kost_pic.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fukko Cozy',
                                style: orderRegular.copyWith(color: orderBlack),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Wanita',
                                style: orderLight.copyWith(
                                    fontSize: 12, color: Color(0xffA5A5A5)),
                              ),
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                        height: 22,
                      ),
                      Divider(
                        color: Color(0xffd8d8d8),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Order Details

                      OrderRow(
                        title: 'Owner',
                        value: 'Oni Priyandika',
                      ),
                      OrderRow(
                        title: 'Phone',
                        value: '085923940012',
                      ),

                      Divider(
                        color: Color(0xffd8d8d8),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      OrderRow(
                        title: 'Rent Month',
                        value: '2 Months',
                      ),
                      OrderRow(
                        title: 'Rental Price /month',
                        value: 'IDR 55.000',
                      ),
                      OrderRow(
                        title: 'Total Price',
                        value: 'IDR 110.000',
                      ),
                      OrderRow(
                        title: 'Phone',
                        value: '081123456789',
                      ),
                      OrderRow(
                        title: 'Tax',
                        value: '10%',
                      ),
                      Divider(
                        color: Color(0xffd8d8d8),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OrderRow(
                        title: 'Total',
                        value: 'IDR 115.475.00',
                        isTotal: true,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Payment Section

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: orderBold.copyWith(color: Color(0xff000000)),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Image.asset(
                            'assets/images/payment/visa.png',
                            width: 43,
                            height: 26,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visa Classic',
                                style: orderMedium.copyWith(
                                    fontSize: 12, color: Color(0xff000000)),
                              ),
                              Text(
                                '••••   ••••   ••••   1996',
                                style: orderSemiBold.copyWith(
                                    fontSize: 10, color: Color(0xff000000)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff8C8C8C),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color(0xffd4d4d4),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Promo code

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        width: double.infinity,
                        child: Text(
                          'Promo Code',
                          style: orderMedium.copyWith(
                              fontSize: 12, color: orderGrey),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
