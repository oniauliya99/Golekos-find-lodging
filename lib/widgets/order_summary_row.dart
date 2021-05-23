import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';

class OrderRow extends StatelessWidget {
  OrderRow({this.title, this.value, this.isTotal = false});

  String title;
  String value;
  bool isTotal;

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
          Text(
            value,
            style: (isTotal)
                ? orderBold.copyWith(color: orderGreen)
                : orderBold.copyWith(color: Color(0xff202020)),
          ),
        ],
      ),
    );
  }
}