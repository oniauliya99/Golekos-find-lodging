import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golekos/services/auth_services.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/list_boarding_houses.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:golekos/models/product.dart';

class Dashboard extends StatefulWidget {
  final User user;

  Dashboard([this.user]);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int productRadius = 0;
  List<Product> product = [];

  TextEditingController searchProduct = TextEditingController();

  @override
  void initState() {
    // Get data when the first page loads
    retrieveData();
    super.initState();
  }

  void retrieveData([String search = '']) async {
    var result = await Product.getProduct(name: search);
    if (result != null) {
      product = result;
    }
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Welcome to app message

    var headerApp = Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: SvgPicture.asset('assets/svg/Icon_menu_outline.svg',
                width: 24, height: 24),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: orderRegular.copyWith(
                    fontSize: 24, color: Color(0xff040507)),
              ),

              // Username is displayed here

              Container(
                width: 250,
                child: Row(
                  children: [
                    Text(
                      widget.user?.email ?? "Guest",
                      style: orderBold.copyWith(
                          fontSize: 24, color: Color(0xff040507)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),

          // User profile shown here

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/man.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );

    // MAIN

    return Scaffold(
      backgroundColor: Color(0xffF2F6FD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),

              // Welcome message and profile

              headerApp,

              SizedBox(
                height: 30,
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search product

                    TextField(
                      controller: searchProduct,
                      onChanged: retrieveData,
                      decoration: InputDecoration(
                        // textfield hint

                        hintText: "Find your next home",
                        hintStyle: orderLight.copyWith(
                            fontSize: 16, color: Color(0xffA5A5A5)),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search_rounded),
                          color: Color(0xffA5A5A5),
                          iconSize: 20,
                        ),

                        // textfield style

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(16),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),

                      // texfield settings

                      maxLength: 25,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      style: orderRegular.copyWith(
                          fontSize: 16, color: Color(0xffA5A5A5)),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // Tips

                    Image.asset(
                      'assets/images/tips.png',
                    ),

                    SizedBox(
                      height: 27,
                    ),

                    Text('Most People Go',
                        style: orderSemiBold.copyWith(
                          fontSize: 18,
                          color: Color(0xff040507),
                        )),
                    SizedBox(
                      height: 16,
                    ),

                    // List of product

                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: product.length,
                        itemBuilder: (context, pos) {
                          try {
                            if (pos == 0) {
                              // Jika posisi saat ini '0', maka aktifkan radius top
                              productRadius = 1;
                            } else if (pos == (product.length - 1)) {
                              // Jika posisi saat ini sama dengan jumlah data, maka aktifkan radius bottom
                              productRadius = 2;
                            } else {
                              // Jika tidak keduanya, maka nonaktifkan radius
                              productRadius = 0;
                            }
                          } catch (e) {
                            print(e.toString());
                          }

                          return BoardingHouses(
                            name: product[pos].name,
                            bed: product[pos].numberOfBed,
                            bath: product[pos].numberOfBath,
                            kitchen: product[pos].numberOfKitchen,
                            location: product[pos].location,
                            type: product[pos].type,
                            price: product[pos].price,
                            imageUrl: product[pos].imageUrl,
                            detector: productRadius,
                          );
                        },
                      ),
                    ),

                    // The distance between the product list and bottom navigation

                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF2F6FD),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         height: 69,
//         child: Row(
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
//                   child: Column(
//                     children: [
//                       Text(
//                         "\$1,355",
//                         style: orderMedium.copyWith(
//                             fontSize: 24, color: Colors.black),
//                       ),
//                       Text(
//                         "/month",
//                         style: orderLight.copyWith(
//                             fontSize: 14, color: Color(0xffA5A5A5)),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Expanded(
//               child: InkWell(
//                 child: Container(
//                   alignment: Alignment.center,
//                   color: Color(0xff29D5F8),
//                   child: Text(
//                     "BOOKING NOW",
//                     style: orderSemiBold.copyWith(
//                         fontSize: 24, color: Colors.white),
//                   ),
//                 ),
//                 onTap: () {
//                   print("object");
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.only(top: 8),
//         child: ListView(
//           physics: ClampingScrollPhysics(),
//           children: [
//             // Custom App Bar
//             Container(
//               margin: EdgeInsets.only(left: 16, right: 16),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // hamburger bar
//                     SvgPicture.asset('assets/svg/Icon_menu_outline.svg'),
//                     Container(
//                         margin: EdgeInsets.only(right: 98, top: 30),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Hello,",
//                               style: orderRegular.copyWith(fontSize: 22),
//                             ),
//                             Text(
//                               // If the user does not have a name and email, then display 'Guest' or user id
//                               'Sayna Far',
//                               // (widget.user.displayName == null)
//                               //     ? ((widget.user.email == null)
//                               //         ? 'Guest'
//                               //         : widget.user.email)
//                               //     : widget.user.displayName,
//                               style: orderBold.copyWith(
//                                   fontSize: 22, fontWeight: FontWeight.bold),
//                               overflow: TextOverflow.ellipsis,
//                             )
//                           ],
//                         )),
//                     // image user
//                     Container(
//                       margin: EdgeInsets.only(top: 19),
//                       height: 69,
//                       width: 69,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/user_pic.png'),
//                         ),
//                       ),
//                     ),
//                   ]),
//             ),

//             // TODO: Sign out

//             Container(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await AuthService.signOut();

//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Sign out'),
//               ),
//             ),

//             Container(
//               margin: EdgeInsets.only(left: 16, right: 16, top: 32),
//               width: double.infinity,
//               height: 55,
//               decoration: BoxDecoration(
//                 color: Color(0xffFFFFFF),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Row(children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Find your next kos",
//                         hintStyle: orderLight.copyWith(
//                             color: Color(0xffA5A5A5), fontSize: 16),
//                         border: InputBorder.none),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {},
//                 )
//               ]),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 30),
//               height: 97,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/tips.png'),
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.only(left: 16, bottom: 19, top: 29, right: 10),
//               child: Text(
//                 "Most People Go",
//                 style: orderBold.copyWith(
//                     fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: product.length,
//                 itemBuilder: (context, index) {
//                   return BoardingHouses(
//                     name: product[index].name,
//                     type: product[index].type,
//                     price: product[index].price.toString(),
//                     imageUrl: product[index].imageUrl,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
