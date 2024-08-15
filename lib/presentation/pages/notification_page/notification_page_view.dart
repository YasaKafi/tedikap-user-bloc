import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'widgets/notification_box.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key,  this.message}) : super(key: key);

  final RemoteMessage? message;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor,
          ),
          padding:
              const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    context.pop();
                  } else {
                    context.goNamed('dashboard',
                        pathParameters: {'pageIndex': '0'});
                  }
                },
              ),
              Text(
                'Notification',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              Container(
                width: 40,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.paddingSizeLarge),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: NotificationFilter(),
              // ),
              SizedBox(height: Dimensions.paddingSizeLarge),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge),
                child: Column(
                  children: [
                    BoxNotification(
                      onTap: () {},
                      color: primaryColor,
                      title: message?.notification?.title ?? 'Lorem ipsum',
                      description: message?.notification?.body ?? 'Lorem ipsum wkwkw'
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
