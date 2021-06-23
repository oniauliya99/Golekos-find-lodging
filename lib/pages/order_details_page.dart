import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golekos/services/db_services.dart';
import 'package:golekos/theme.dart';
import '../widgets/order-details/order_details.dart';
import 'package:intl/intl.dart';
import 'package:clipboard/clipboard.dart';

enum payment { transfer, onsite }

class OrderDetails extends StatefulWidget {
  OrderDetails({this.id, this.object});

  final id;
  final Map<String, dynamic> object;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  payment paymentSelect = payment.onsite;
  String paymentSelected = 'Onsite';

  selectAPayment(value) {
    switch (paymentSelect) {
      case payment.transfer:
        paymentSelected = 'Bank Transfer';
        updatePaymentData(paymentSelected);
        break;
      case payment.onsite:
        paymentSelected = 'Onsite';
        updatePaymentData(paymentSelected);
        break;
    }
    setState(() {});
  }

  Future<void> updatePaymentData(String payment) {
    return orders
        .doc(widget.id)
        .update({
          'payment': payment,
        })
        .then((value) => print('Payment Updated'))
        .catchError((error) => print('Payment update failed: $error'));
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,##0", "en_US");

    return Scaffold(
      backgroundColor: Color(0xffF2F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: FutureBuilder<DocumentSnapshot>(
              future: orders.doc(widget.id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Failed to load order'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      // Title Order Section

                      AppBar(
                        centerTitle: true,
                        title: Text(
                          'ORDER #${data['orderID']}',
                          style: orderBold.copyWith(color: orderBlack),
                        ),
                        leading: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: orderGrey,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(data['orderID'])
                                  .then((value) => {
                                        messageDialog(context,
                                            icon: 'Icons.info',
                                            title: 'Copy success',
                                            message:
                                                'Order #${data['orderID']} was copied successfully')
                                      });
                            },
                            icon: Icon(Icons.copy),
                            color: orderGrey,
                            tooltip: 'Copy this order',
                            constraints: BoxConstraints(),
                          )
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),

                      SizedBox(
                        height: 35,
                      ),

                      // Order Summary Section

                      OrderSummaryDetails(
                          data: data,
                          currencyFormat: currencyFormat,
                          messageDialog: messageDialog),

                      SizedBox(
                        height: 20,
                      ),

                      // Payment Section

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Method',
                              style:
                                  orderBold.copyWith(color: Color(0xff000000)),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            TextButton(
                                onPressed: () {
                                  (data['paid'])
                                      ? messageDialog(context,
                                          icon: 'Icons.info',
                                          title: 'Already Paid',
                                          message:
                                              'You have paid this bill, hope you enjoy your trip.')
                                      : choosePaymentDialog(context);
                                },
                                child: Row(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (paymentSelected == 'Onsite')
                                              ? 'On site'
                                              : 'Bank transfer',
                                          style: orderMedium.copyWith(
                                              fontSize: 12,
                                              color: Color(0xff000000)),
                                        ),
                                        Text(
                                          (paymentSelected == 'Onsite')
                                              ? 'No details needed'
                                              : '••••   ••••   ••••   1996',
                                          style: orderSemiBold.copyWith(
                                              fontSize: 10,
                                              color: Color(0xff000000)),
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
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                )),

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
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  (data['paid'])
                                      ? messageDialog(context,
                                          icon: 'Icons.info',
                                          title: 'Already Paid',
                                          message:
                                              'You have paid this bill, hope you enjoy your trip.')
                                      : (data['payment'] == 'unregistered')
                                          ? choosePaymentDialog(context)
                                          : (data['payment'] == 'Bank Transfer')
                                              ? paymentInformation(context)
                                              : messageDialog(context,
                                                  icon: 'Icons.info',
                                                  title: 'Notification',
                                                  message:
                                                      'Make payments directly to the owner of the boarding house, then remind the owner to confirm the payment to the admin.');
                                },
                                child: Text((data['payment'] == 'unregistered')
                                    ? 'PLEASE CHOOSE YOUR PAYMENT'
                                    : (data['paid'])
                                        ? 'ORDER COMPLETE'
                                        : 'PAY'),
                                style: ElevatedButton.styleFrom(
                                  primary: (data['paid'])
                                      ? Colors.grey.withOpacity(0.5)
                                      : Color(0xffFFC33A),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  textStyle: orderMedium.copyWith(
                                      fontSize: 12, color: Color(0xff414B5A)),
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> paymentInformation(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.payment,
                  color: Colors.blue,
                  size: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Payment Information',
                  style: orderBold.copyWith(
                      fontSize: 14, color: Colors.blueAccent),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PLEASE READ BEFORE PAYMENT

                  Text(
                    'PLEASE READ !!!\n\n If you make a transaction in the Golekos application, it means that you have complied with the policies made by ORITech Corporation. Anything prohibited will be the responsibility of the user. If you agree to these rules, you may transfer payments to the following account.',
                    style: orderRegular.copyWith(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'BANK ACCOUNT',
                    style: orderBold.copyWith(color: Colors.blueAccent),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // BANK INFORMATION

                  accountInformation('BCA', '2190249328'),
                  accountInformation('MANDISENDIRI', '0948974959'),
                  accountInformation('BNI', '0213099034'),

                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'CONFIRM PAYMENT',
                    style: orderBold.copyWith(color: Colors.blueAccent),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Confirm your payment to the following number',
                    style: orderRegular.copyWith(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  accountInformation('Oni chan', '08310309434'),
                  accountInformation('Irfan kun', '08920309439'),
                  accountInformation('Ridlo sama', '08101434983'),

                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '*Hint: hold the account number to copy',
                    style: orderRegular.copyWith(color: Colors.black45),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Done')),
            ],
          );
        });
  }

  accountInformation(String name, String number) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: orderBold.copyWith(color: Colors.black54),
          ),
          SelectableText(
            number,
            style: orderBold.copyWith(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Future<dynamic> choosePaymentDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Choose payment',
                      style: orderBold.copyWith(color: orderBlack),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextButton(
                        onPressed: () {
                          paymentSelect = payment.transfer;
                          selectAPayment(paymentSelect);
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/payment/visa.png',
                                width: 43, height: 26),
                            SizedBox(
                              width: 12,
                            ),
                            Text('Bank transfer',
                                style: orderMedium.copyWith(
                                    fontSize: 12, color: Color(0xff000000))),
                          ],
                        )),
                    Divider(
                      color: Colors.black12,
                      height: 2,
                    ),
                    TextButton(
                        onPressed: () {
                          paymentSelect = payment.onsite;
                          selectAPayment(paymentSelect);
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/payment/visa.png',
                                width: 43, height: 26),
                            SizedBox(
                              width: 12,
                            ),
                            Text('Onsite',
                                style: orderMedium.copyWith(
                                    fontSize: 12, color: Color(0xff000000))),
                          ],
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  // Your information message

  Future<dynamic> messageDialog(BuildContext context,
      {@required String icon, String title, message}) {
    return showDialog(
        context: (context),
        builder: (_) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 18,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: orderBold.copyWith(
                      fontSize: 14, color: Colors.blueAccent.withOpacity(0.8)),
                ),
              ],
            ),
            content: Text(
              message,
              style: orderRegular.copyWith(fontSize: 15, color: Colors.grey),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Done'))
            ],
          );
        });
  }
}
