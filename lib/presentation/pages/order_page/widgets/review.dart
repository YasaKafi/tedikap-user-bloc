import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/request/post_review_request_model.dart';

import '../../../../common/theme.dart';
import '../../../global_components/common_button.dart';
import '../bloc/order_bloc.dart';

class RateAndReviewSheet extends StatelessWidget {
  final String? orderId;
  final String? orderRewardId;
  final TextEditingController _noteController = TextEditingController();
  final ValueNotifier<double> _staffServiceRating = ValueNotifier(0);
  final ValueNotifier<double> _productQualityRating = ValueNotifier(0);

  RateAndReviewSheet({Key? key, required this.orderId, this.orderRewardId, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
                                value: '${orderRewardId}',
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
                    child: BlocConsumer<OrderBloc, OrderState>(
                      listener: (context, state) {
                        print('State: $state');
                        state.maybeWhen(
                            orElse: (){},
                            success: (model,
                                modelReward,
                                filterIndex,
                                modelReOrder,
                                modelReOrderReward,
                                modelReview,
                                isPesananDitolak,
                                isPesananDibatalkan,
                                isPesananSelesai,
                                startDate,
                                endDate,
                                isPesananDitolakReward,
                                isPesananSelesaiReward,
                                startDateReward,
                                endDateReward) {
                              print('modelReview: ${modelReview?.data}');
                              if (modelReview?.data != null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    'Review success!',
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500, color: baseColor),
                                  ),
                                  backgroundColor: greenMedium,
                                ));
                                context.goNamed('dashboard', pathParameters: {'pageIndex': '2'});
                              }
                            }
                        );
                      },

                      builder: (context, state){
                        return CommonButton(
                          width: double.infinity,
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          text: 'Kirim Ulasan',
                          onPressed: () {
                            final modelPostReview = PostReviewRequestModel(
                              staffService: _staffServiceRating.value,
                              productQuality: _productQualityRating.value,
                              note: _noteController.text,
                            );

                            if (orderId != null && orderId != '0') {
                              context.read<OrderBloc>().add(OrderEvent.postReview(orderId!, modelPostReview));
                            } else if (orderRewardId != null && orderRewardId != '0') {
                              context.read<OrderBloc>().add(OrderEvent.postReview(orderRewardId!, modelPostReview));
                            } else {
                              print('ORDER ID NULL');
                            }
                          },

                          backgroundColor: primaryColor,
                          textColor: baseColor,
                          borderRadius: 30,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        );
                      },

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
          ratingNotifier: _staffServiceRating,
        ),
        SizedBox(height: 10),
        Divider(color: Colors.grey[200], height: 2),
        SizedBox(height: 10),
        _buildRatingQuestion(
          question: '2. Kualitas Produk?',
          ratingNotifier: _productQualityRating,
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
              controller: _noteController,
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

  Widget buildLoadingShimmer(double screenWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.8,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingQuestion({
    required String question,
    required ValueNotifier<double> ratingNotifier,
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
        ValueListenableBuilder<double>(
          valueListenable: ratingNotifier,
          builder: (context, rating, child) {
            return RatingBar.builder(
              initialRating: rating,
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
              onRatingUpdate: (newRating) {
                ratingNotifier.value = newRating;
              },
            );
          },
        ),
      ],
    );
  }
}
