import 'package:em_channel/color_const.dart';
import 'package:em_channel/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        width: context.width,
        color: lightGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 130, child: Image.asset('assets/image/man.jpg')),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Wai Phyo Aung',
                style: TextStyle(
                  // color: blue,
                  fontSize: 15,
                  fontFamily: 'Libre_Baskerville',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Wai Phyo Aung',
                style: TextStyle(
                  // color: darkLightGray,
                  fontFamily: 'Libre_Baskerville',
                  fontSize: 11,
                ),
              ),
            ),
            Container(
              // color: white,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wai Phyo Aung',
                    style: TextStyle(
                        // color: blue,
                        fontFamily: 'Libre_Baskerville',
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '39',
                      style: TextStyle(
                          // color: blue,
                          fontFamily: 'Libre_Baskerville',
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    // color: blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Yangon, Myanmar',
                      style: TextStyle(
                          // color: blue,
                          fontFamily: 'Libre_Baskerville',
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  // Text(
                  //   '09 -9513 666 91',
                  //   style: TextStyle(
                  //       // color: blue,
                  //       fontFamily: 'Libre_Baskerville',
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 24),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // HomeContainer()
          ],
        ),
      ),
    );
  }
}
