import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme.dart';
import '../../../global_components/common_button.dart';
import '../bloc/order_bloc.dart';

class RateAndReviewSheet extends StatelessWidget {
  const RateAndReviewSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Ensures scrolling is always possible
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: baseColor,
              ),
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      context.pop();
                                    },
                                  ),
                                  Text(
                                    'Nilai Pesanan Kamu',
                                    style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.grey[200],
                                height: 2,
                              ),
                              SizedBox(height: 10),
                              _buildOrderDetailRow(
                                title: 'Tanggal Pesanan',
                                value: '17 August 2024 | 15:06',
                              ),
                              SizedBox(height: 10),
                              _buildOrderDetailRow(
                                title: 'Outlet Name',
                                value: 'Tedikap RUS (Raden Umar Said)',
                              ),
                              SizedBox(height: 10),
                              _buildOrderDetailRow(
                                title: 'Waktu Pick Up',
                                value: '15:15',
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[200],
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bantu Kami Menjadi Lebih Baik',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                              SizedBox(height: 15),
                              _buildRatingSection(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: CommonButton(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      text: 'Pesan Ulang',
                      onPressed: () {},
                      backgroundColor: primaryColor,
                      textColor: baseColor,
                      borderRadius: 30,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderDetailRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: txtSecondarySubTitle.copyWith(
            fontWeight: FontWeight.w500,
            color: blackColor,
          ),
        ),
        Text(
          value,
          style: txtSecondarySubTitle.copyWith(
            fontWeight: FontWeight.w500,
            color: blackColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRatingQuestion(
          question: '1. Pelayanan staf?',
          onRatingUpdate: (rating) => print(rating),
        ),
        SizedBox(height: 10),
        Divider(color: Colors.grey[200], height: 2),
        SizedBox(height: 10),
        _buildRatingQuestion(
          question: '2. Kualitas Produk?',
          onRatingUpdate: (rating) => print(rating),
        ),
        SizedBox(height: 10),
        Divider(color: Colors.grey[200], height: 2),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3. Catatan (Note)',
              style: txtSecondaryTitle.copyWith(
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLength: 200,
              maxLines: 6,
              minLines: 1,
              style: txtPrimarySubTitle.copyWith(
                  fontWeight: FontWeight.w500, color: blackColor),
              decoration: InputDecoration(
                hintText: 'Add notes here..',
                hintStyle: txtPrimarySubTitle.copyWith(
                    fontWeight: FontWeight.w500, color: blackColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingQuestion({
    required String question,
    required void Function(double rating) onRatingUpdate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: txtSecondaryTitle.copyWith(
            fontWeight: FontWeight.w500,
            color: blackColor,
          ),
        ),
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star_rate_rounded,
            color: primaryColor,
            size: 16,
          ),
          onRatingUpdate: onRatingUpdate,
        ),
      ],
    );
  }
}
