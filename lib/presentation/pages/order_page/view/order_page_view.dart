import 'package:flutter/material.dart';


import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../widgets/list_box_order_status.dart';
import '../widgets/list_box_order_status_over.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: baseColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: baseColor,
          title: Center(
            child: Text(
              'Order',
              style: txtSecondaryHeader.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor),
            ),
          ),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.05,
                  width: screenWidth,
                  child: TabBar(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeLarge),
                    dividerHeight: 2,
                    dividerColor: grey,
                    indicatorColor: blackColor,
                    labelColor: blackColor,
                    unselectedLabelColor: grey,
                    tabs: [
                      Tab(
                        child: Text(
                          'Ongoing',
                          style: txtSecondaryTitle.copyWith(
                              fontWeight: FontWeight.w600, color: blackColor),
                        ),
                      ),
                      Tab(
                          child: Text('History',
                              style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor))),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Tab(
                        child:
                             ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {},
                                    child: ListBoxMenuStatus(
                                      status: 'In Progress',
                                      totalItem: '8',
                                      totalPrice: '10000',
                                      orderItems: [
                                        '1x Nasi Goreng',
                                        '2x Ayam Goreng',
                                        '1x Es Teh',
                                      ],
                                    ));
                              },
                            ),
                      ),
                      Tab(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {}, child: ListBoxMenuStatusOver());
                          },
                        ),
                      ),
                    ],
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
