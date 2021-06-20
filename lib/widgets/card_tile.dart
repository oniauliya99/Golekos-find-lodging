import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/product.dart';

class CardTile extends StatefulWidget {
  CardTile({this.object});

  final Map<String, dynamic> object;

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  String kostName;
  String imageUrl;

  @override
  void initState() {
    super.initState();
    getKost(widget.object['kostID']).then((value) {
      setState(() {
        kostName = value.name;
        imageUrl = value.imageUrl;
      });
    });
  }

  Future<Product> getKost(int id) async {
    var productById = await Product.getProductById(id);
    return productById;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl ?? 'https://via.placeholder.com/150',
              width: 54.19,
              height: 54.19,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            kostName ?? 'no name',
            style: orderBold.copyWith(fontSize: 16, color: Color(0xff181818)),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            widget.object['booking_date'] ?? '01-01-1999',
            style:
                orderRegular.copyWith(fontSize: 12, color: Color(0xffB2B2B2)),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            (widget.object['paid'] == false) ? 'Wait' : 'Paid',
            style: (widget.object['paid'] == false)
                ? orderBold.copyWith(fontSize: 16, color: Colors.red)
                : orderBold.copyWith(fontSize: 16, color: Color(0xff2C6D6A)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.84),
          )),
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
