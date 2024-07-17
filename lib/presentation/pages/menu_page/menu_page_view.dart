import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/menu_page/bloc/menu_bloc.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/list_box_product_menu.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    context.read<MenuBloc>().add(MenuEvent.getProduct());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              return CustomAppBar(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                onSearch: (query) {
                  if (query.length >= 1) { // Minimum character threshold
                    context.read<MenuBloc>().add(MenuEvent.getFilterSearch(query));
                  }
                },
                onClearSearch: () {
                  context.read<MenuBloc>().add(MenuEvent.getProduct());
                },
                searchController: _searchController,
              );
            },
          ),
        ),
        body: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: CircularProgressIndicator()),
              success: (model, isSearching) {
                return Column(
                  children: [
                    Container(
                      height: screenHeight * 0.05,
                      width: screenWidth,
                      child: BlocBuilder<MenuBloc, MenuState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => Center(child: CircularProgressIndicator()),
                            success: (model, _) {
                              return TabBar(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeLarge,
                                ),
                                dividerHeight: 2,
                                dividerColor: grey,
                                indicatorColor: blackColor,
                                labelColor: blackColor,
                                unselectedLabelColor: grey,
                                onTap: (index) {
                                  switch (index) {
                                    case 0:
                                      context.read<MenuBloc>().add(
                                          MenuEvent.getFilterSearch(_searchController.text));
                                      break;
                                    case 1:
                                      context.read<MenuBloc>().add(
                                          MenuEvent.getFilterCategory('tea'));
                                      break;
                                    case 2:
                                      context.read<MenuBloc>().add(
                                          MenuEvent.getFilterCategory('nontea'));
                                      break;
                                    case 3:
                                      context.read<MenuBloc>().add(
                                          MenuEvent.getFilterCategory('snack'));
                                      break;
                                  }
                                },
                                tabs: [
                                  Tab(
                                    child: Text('All',
                                        style: txtPrimarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: blackColor)),
                                  ),
                                  Tab(
                                    child: Text('Tea',
                                        style: txtPrimarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: blackColor)),
                                  ),
                                  Tab(
                                    child: Text('Non Tea',
                                        style: txtPrimarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: blackColor)),
                                  ),
                                  Tab(
                                    child: Text('Snack',
                                        style: txtPrimarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: blackColor)),
                                  ),
                                ],
                              );
                            },
                            loading: () => Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (message) => Center(
                              child: Text(
                                message!,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600, color: blackColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          buildProductList(),
                          buildProductList(),
                          buildProductList(),
                          buildProductList(),
                        ],
                      ),
                    ),
                  ],
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Text(
                  message!,
                  style: txtSecondaryTitle.copyWith(
                      fontWeight: FontWeight.w600, color: blackColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildProductList() {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(child: CircularProgressIndicator()),
          success: (model, _) {
            return ListView.builder(
              itemCount: model!.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ListBoxProductMenu(
                    screenHeight: MediaQuery.of(context).size.height,
                    screenWidth: MediaQuery.of(context).size.width,
                    image: model.data![index].image!,
                    category: model.data![index].category!,
                    title: model.data![index].name!,
                    rating: 4.5,
                    price: model.data![index].regularPrice!,
                  ),
                );
              },
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Text(
              message!,
              style: txtSecondaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor),
            ),
          ),
        );
      },
    );
  }
}
