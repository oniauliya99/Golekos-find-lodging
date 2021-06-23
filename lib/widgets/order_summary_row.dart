import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';

class OrderRow extends StatelessWidget {
  OrderRow(
      {this.title,
      this.value,
      this.isTotal = false,
      this.isPaymentStatus = false,
      this.messageDialog});

  String title;
  var value;
  bool isTotal;
  bool isPaymentStatus;
  Function messageDialog;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: (isTotal)
                ? orderBold.copyWith(color: Color(0xff202020))
                : orderRegular.copyWith(color: orderGrey),
          ),
          (isPaymentStatus)
              ? Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {
                          messageDialog(context,
                              icon: 'Icons.info',
                              title: 'Pay your bill',
                              message:
                                  'Please pay before using and call the number listed to confirm your payment');
                        },
                        icon: Icon(Icons.info_outline),
                        color: Colors.grey.withOpacity(0.5),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerRight,
                        iconSize: 20,
                        constraints: BoxConstraints(),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      (value == false)
                          ? 'Not Yet Paid'
                          : (value == true)
                              ? 'Payment success'
                              : value,
                      style: (isTotal)
                          ? orderBold.copyWith(color: orderGreen)
                          : ((isPaymentStatus)
                              ? orderBold.copyWith(color: Color(0xffE9421E))
                              : orderBold.copyWith(color: Color(0xff202020))),
                    ),
                  ],
                )
              : Text(value,
                  style: (isTotal)
                      ? orderBold.copyWith(color: orderGreen)
                      : ((isPaymentStatus)
                          ? orderBold.copyWith(color: Color(0xffE9421E))
                          : orderBold.copyWith(color: Color(0xff202020)))),
        ],
      ),
    );
  }
}
