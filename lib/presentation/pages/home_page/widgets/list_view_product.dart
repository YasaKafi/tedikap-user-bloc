import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import '../../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import 'list_box_product.dart';
import 'package:shimmer/shimmer.dart';


class ListViewProduct extends StatelessWidget {
  const ListViewProduct({
    Key? key,
    required this.screenWidth,

  }) : super(key: key);


  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 200, maxHeight: 270),
        width: screenWidth,
        padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeSmall,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
                initial: () => Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of shimmer items to show
                  itemBuilder: (context, index) {
                    return ShimmerListBoxProduct();
                  },
                ),
                success: (model, user, index, pointModel, statusOutletModel) {
                  if (model != null){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.data!.length,
                      itemBuilder: (context, index) {
                        final bestSeller = model.data![index];
                        // final imageUrl = TedikapApiRepository.getImage + bestSeller.image!;
                        return InkWell(
                          onTap: () {
                            context.pushNamed('detail_product_common', pathParameters: {'productId': bestSeller.id!.toString()});
                          },
                          child: ListBoxProduct(
                            image: bestSeller.image!,
                            rating: bestSeller.favoritesCount!,
                            price: bestSeller.regularPrice!.toString(),
                            title: bestSeller.name!,
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No data product available'),);
                  }

                },
                error: (message) => Center(
                  child: Text(message!),
                ));

          },
        )
    );
  }
}



class ShimmerListBoxProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Dimensions.marginSizeLarge,
          top: Dimensions.marginSizeSmall,
          bottom: Dimensions.marginSizeSmall),
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        shape: BoxShape.rectangle,
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraSmall,
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Dimensions.iconSizeKindDeafult,
                        width: Dimensions.iconSizeKindDeafult,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
