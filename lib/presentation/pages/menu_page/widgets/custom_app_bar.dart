import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onSearch,
    required this.onClearSearch,
    required this.searchController,
  });

  final double screenHeight;
  final double screenWidth;
  final Function(String) onSearch;
  final TextEditingController searchController;
  final VoidCallback onClearSearch;

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;
    searchController.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (searchController.text.isEmpty) {
          onClearSearch();
        } else {
          onSearch(searchController.text);
        }
      });
    });

    return SafeArea(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: Dimensions.paddingSizeExtraSmall,
                  ),
              padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(232, 232, 232, 100), width: 2),
                  color: const Color.fromRGBO(246, 246, 246, 100),
                  borderRadius: BorderRadius.circular(35)),
              width: screenWidth * 0.9,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: searchController,
                style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 100)),
                    focusColor: const Color.fromRGBO(246, 246, 246, 100),
                    fillColor: const Color.fromRGBO(246, 246, 246, 100),
                    hintText: 'What would you like to drink today?',
                    hintStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
