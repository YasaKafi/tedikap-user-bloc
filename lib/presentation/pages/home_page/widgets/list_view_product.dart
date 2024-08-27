import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/shimmer_widget_home.dart';
import '../../../../../common/dimensions.dart';
import 'list_box_product.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    double maxHeightBox = dpi < 380 ? 280 : 290;
    return Container(
        constraints: BoxConstraints(minHeight: 200, maxHeight: maxHeightBox),
        width: screenWidth,
        padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeSmall,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shimmer items to show
                itemBuilder: (context, index) {
                  return ShimmerWidgetsHome.listViewProduct(screenWidth);
                },
              ),
              loading: () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shimmer items to show
                itemBuilder: (context, index) {
                  return ShimmerWidgetsHome.listViewProduct(screenWidth);
                },
              ),
              success: (model, user, index, pointModel, statusOutletModel,
                  bannerModel, boxPromoModel) {
                if (model != null) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.data!.length,
                    itemBuilder: (context, index) {
                      final bestSeller = model.data![index];

                      final formattedPrice = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp',
                        decimalDigits: 0, // Tidak ada digit desimal
                      ).format(int.parse(bestSeller.regularPrice.toString()));
                      final String priceProduct = bestSeller.stock == true ? formattedPrice : 'Out of stock';
                      return InkWell(
                        onTap: () {
                          context.pushNamed('detail_product_common',
                              pathParameters: {
                                'productId': bestSeller.id!.toString()
                              });
                        },
                        child: ListBoxProduct(
                          image: bestSeller.image!,
                          favorite: bestSeller.favoritesCount!,
                          category: bestSeller.category!,
                          price: priceProduct,
                          title: bestSeller.name!,
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No data product available'),
                  );
                }
              },
              error: (message) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shimmer items to show
                itemBuilder: (context, index) {
                  return ShimmerWidgetsHome.listViewProduct(screenWidth);
                },
              ),
            );
          },
        ));
  }
}
