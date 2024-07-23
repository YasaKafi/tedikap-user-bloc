import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/bloc/favorite_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/widgets/list_box_product_favorite.dart';

import '../../../common/theme.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(FavoriteEvent.getFavorite());
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.pop();
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
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return state.when(
                  initial: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (modelPost, modelFavorite, modelProduct,  isLike){
                    if(modelFavorite != null){
                      final itemFavorite = modelFavorite.data;
                      return ListView.builder(
                        itemCount: itemFavorite!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final item = modelProduct!.data![index];
                          final isItemLiked = itemFavorite.any((fav) => fav.productId == item.id);

                          return InkWell(
                            onTap: () {},
                            child: ListBoxProductFavorite(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              image: item!.image!,
                              category: item.category!,
                              title: item.name!,
                              desc: item.description!,
                              price: item.regularPrice!,
                              productId: item.id!,
                              isLiked: isItemLiked,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }

                  },
                error: (message) => Center(
                  child: Text(message!),
                ),
              );


            },
          ),
        )
    );
  }
}