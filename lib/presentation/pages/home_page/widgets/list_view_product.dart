import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import '../../../../../common/dimensions.dart';
import 'list_box_product.dart';


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
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                success: (model, user, index) {
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
                            rating: 4.5,
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


