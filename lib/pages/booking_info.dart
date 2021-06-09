import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';

class BookingInfo extends StatefulWidget {
  const BookingInfo();

  @override
  _BookingInfoState createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  TextEditingController phone, email, name, longStay = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // First stack

    var ovalImages = Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        'assets/images/oval.png',
        width: 117,
        height: 117,
      ),
    );

    // Second stack
    // TODO: Aktivitas pengisian detail booking

    var form = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Information',
                style: orderMedium.copyWith(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please fill in the following booking details',
                style: orderRegular.copyWith(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),

                // Email input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Long stay input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How long?',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: longStay,
                        decoration: InputDecoration(
                          suffix: Text(
                            'Month',
                            style: orderRegular.copyWith(
                                fontSize: 14, color: Color(0xff979797)),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Phone input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.phone,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // User input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Check details'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFFC33A),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: orderMedium.copyWith(
                          fontSize: 16, color: Color(0xff414B5A)),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );

    // MAIN

    return Scaffold(
      backgroundColor: Color(0xff0062CD),
      body: SafeArea(
          child: Stack(
        children: [
          ovalImages,
          form,
        ],
      )),
    );
  }
}
