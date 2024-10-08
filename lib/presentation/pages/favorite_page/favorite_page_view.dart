import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/global_components/empty_state.dart';
import 'package:tedikap_user_bloc/presentation/global_components/error_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/bloc/favorite_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/widgets/list_box_product_favorite.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  void _fetchInitialData() {
    context.read<FavoriteBloc>().add(const FavoriteEvent.getFavorite());
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Shimmer? loadingCard() {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: Dimensions.marginSizeSmall),
                  width: 70,
                  height: 70,
                  decoration: const ShapeDecoration(
                    color: grey,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.marginSizeLarge,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    width: screenWidth * 0.5,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    width: screenWidth * 0.45,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                width: Dimensions.marginSizeLarge,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    width: screenWidth * 0.1,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor,
          ),
          padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (Navigator.canPop(context)){
                  context.pop();
                  } else {
                    context.goNamed('dashboard', pathParameters: {'pageIndex': '3'});
                  }
                },
              ),
              Text(
                'My Favorite',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              Container(
                width: 40,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (modelPost, modelFav) {
                if (modelPost != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Successfully removed from my favorite!',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w500, color: baseColor),
                    ),
                    backgroundColor: greenMedium,
                  ));
                }
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return loadingCard();
                },
              ),
              loading: () => ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return loadingCard();
                },
              ),
              success: (modelPost, modelFavorite) {
                final itemFavorite = modelFavorite?.data;
                if (itemFavorite == null || itemFavorite.isEmpty) {
                  return EmptyStateWidgetStatic.buildEmptyState(context, title: 'Nothing is in your wishlist', desc: 'Your wishlist is currently empty', icon: icFavoriteEmpty,);
                } else {
                  return ListView.builder(
                    itemCount: itemFavorite.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = itemFavorite[index];
                      final itemFav = item.product!;
                      return InkWell(
                        onTap: () {
                          context.pushNamed('detail_product_common',
                              pathParameters: {
                                'productId': itemFav.id!.toString()
                              });                        },
                        child: ListBoxProductFavorite(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          image: itemFav.image!,
                          category: itemFav.category!,
                          title: itemFav.name!,
                          desc: itemFav.description!,
                          price: itemFav.regularPrice!,
                          productId: itemFav.id!,
                          isLiked: itemFav.isLiked!,
                        ),
                      );
                    },
                  );
                }
              },
              error: (message) =>  ErrorWidgetStatic.buildErrorState(context, message!),
            );
          },
        ),
      ),
    );
  }

}

