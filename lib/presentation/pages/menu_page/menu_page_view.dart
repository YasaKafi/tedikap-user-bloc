import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/global_components/alert_dialog.dart';
import 'package:tedikap_user_bloc/presentation/global_components/error_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/menu_page/bloc/menu_bloc.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/list_box_product_menu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin{
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      if (searchController.text.isEmpty) {

        if (_tabController.indexIsChanging) return; // To avoid triggering when the tab is still changing

        switch (_tabController.index) {
        case 0:
          context.read<MenuBloc>().add(MenuEvent.getFilterSearch(searchController.text));
          break;
        case 1:
          context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('tea'));
          break;
        case 2:
          context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('nontea'));
          break;
        case 3:
          context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('yakult'));
          break;
      }
      } else { // Jika mode pencarian aktif
        _tabController.index = 0; // Tetap di tab 'All'
      }
    });

    context.read<MenuBloc>().add(const MenuEvent.getProduct());
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle textStyleTitle = dpi < 380 ? txtThirdSubTitle : txtSecondarySubTitle;

    return DefaultTabController(
      length: 4,
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          print('onPopInvoked didPop? $didPop');
          if (didPop == false) {
            final shouldPop = await onShowAlertDialog(
              context,
              title: 'Are you sure?',
              desc: 'Do you want to exit the app?',
              textBtn1: 'Cancel',
              textBtn2: 'Exit',
              bgColorBtn1: navyColor,
              bgColorBtn2: redMedium,
              titleStyle: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
              descStyle: txtSecondarySubTitle.copyWith(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
              icon: null,
              onPressed: () => SystemNavigator.pop(),
              bgColor: baseColor,
            );
            return shouldPop; // Return the result of the dialog
          }
        },
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
                    if (query.isNotEmpty) {
                      context.read<MenuBloc>().add(MenuEvent.getFilterSearch(query));
                    }
                  },
                  onClearSearch: () {
                    context.read<MenuBloc>().add(const MenuEvent.getProduct());
                  },
                  searchController: searchController,
                );
              },
            ),
          ),
          body: BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth,
                    margin: const EdgeInsets.only(top: Dimensions.marginSizeSmall),
                    child: BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        return TabBar(
                          controller: _tabController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeLarge,
                          ),
                          dividerHeight: 2,
                          dividerColor: grey,
                          indicatorColor: blackColor,
                          labelColor: blackColor,
                          unselectedLabelColor: grey,
                          onTap: (index) {
                            if (searchController.text.isEmpty) { // Jika mode pencarian tidak aktif
                              switch (index) {
                                case 0:
                                  context.read<MenuBloc>().add(MenuEvent.getFilterSearch(searchController.text));
                                  break;
                                case 1:
                                  context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('tea'));
                                  break;
                                case 2:
                                  context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('nontea'));
                                  break;
                                case 3:
                                  context.read<MenuBloc>().add(const MenuEvent.getFilterCategory('yakult'));
                                  break;
                              }
                            } else { // Jika mode pencarian aktif
                              _tabController.index = 0; // Tetap di tab 'All'
                            }
                          },
                          tabs: [
                            Tab(
                              child: Text('All',
                                  style: textStyleTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor)),
                            ),
                            Tab(
                              child: Text('Tea',
                                  style: textStyleTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor)),
                            ),
                            Tab(
                              child: Text('Non Tea',
                                  style: textStyleTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor)),
                            ),
                            Tab(
                              child: Text('Yakult',
                                  style: textStyleTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics:searchController.text.isEmpty ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        buildProductList(searchController.text),
                        buildProductList(searchController.text),
                        buildProductList(searchController.text),
                        buildProductList(searchController.text),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildProductList(String query) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        Shimmer? loadingCard() {
          double screenWidth = MediaQuery.of(context).size.width;
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
                      width: 60,
                      height: 60,
                      decoration: const ShapeDecoration(
                        color: grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))),
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
                        width: screenWidth * 0.4,
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
        return state.when(
          initial: () => ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return loadingCard();
            },
          ),
          success: (model, isSearching) {
            if (isSearching && model!.data!.isEmpty) {
              return _buildEmptySearchState(context, query);
            }
            return ListView.builder(
              itemCount: model!.data!.length,
              itemBuilder: (context, index) {
                final itemProduct = model.data![index];
                final formattedPrice = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp',
                  decimalDigits: 0, // Tidak ada digit desimal
                ).format(int.parse(itemProduct.regularPrice.toString()));
                final String priceProduct = itemProduct.stock == true ? formattedPrice : 'Sold out';
                if (model.data != null) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed('detail_product_common', pathParameters: {'productId': itemProduct.id!.toString()});
                    },
                    child: ListBoxProductMenu(
                      screenHeight: MediaQuery.of(context).size.height,
                      screenWidth: MediaQuery.of(context).size.width,
                      image: itemProduct.image!,
                      title: itemProduct.name!,
                      price: priceProduct,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              },
            );
          },
          loading: () => ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return loadingCard();
            },
          ),
          error: (message) => ErrorWidgetStatic.buildErrorState(context, message!),
          empty: () => _buildEmptySearchState(context, query),
        );
      },
    );
  }

  Widget _buildEmptySearchState(BuildContext context, String productName) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icSearchEmpty, width: screenWidth * 0.5),
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.8,
            child: Column(
              children: [
                Text(
                  'Product not found',
                  style: txtPrimaryTitle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'We could not find a match for "$productName". Please try another search.',
                  style: txtSecondarySubTitle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
