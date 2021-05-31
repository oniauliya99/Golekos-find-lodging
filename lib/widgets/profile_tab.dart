import 'package:flutter/material.dart';
import 'package:golekos/theme.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab(@required this.tabTitle,
      {this.title = 'no title',
      this.subTitle = 'no text',
      this.note = 'no text',
      this.imgUrl = 'assets/images/noproduct.png'});

  String tabTitle, title, subTitle, note, imgUrl;

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.tabTitle, // Tab title
          style: orderSemiBold.copyWith(fontSize: 16, color: Color(0xff000000)),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                cardTile(),
                cardTile(),
                cardTile(),
                cardTile(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  cardTile() {
    return Card(
      child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.imgUrl,
              width: 54.19,
              height: 54.19,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            widget.title,
            style: orderBold.copyWith(fontSize: 16, color: Color(0xff181818)),
          ),
          subtitle: Text(
            widget.subTitle,
            style:
                orderRegular.copyWith(fontSize: 12, color: Color(0xffB2B2B2)),
          ),
          trailing: (widget.note.isNotEmpty)
              ? Text(
                  widget.note,
                  style: orderBold.copyWith(
                      fontSize: 16, color: Color(0xff0C053A)),
                )
              : Text(''),
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
