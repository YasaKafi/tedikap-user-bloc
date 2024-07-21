import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class InputNotes extends StatelessWidget {
  InputNotes({super.key, required this.notesController});

  TextEditingController? notesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Notes',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor)),
                  SizedBox(
                    width: 5,
                  ),
                  Text('(Optional)',
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor)),
                ],
              ),
              SizedBox(height: 10),
              BlocBuilder<DetailProductBloc, DetailProductState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                      success: (modelProduct,
                          modelProductReward,
                          modelCartPost,
                          modelCartPostReward,
                          modelCartItem,
                          modelCartUpdate,
                          isTempSelected,
                          selectedTemp,
                          isSizeSelected,
                          selectedSize,
                          isIceSelected,
                          selectedIce,
                          isSugarSelected,
                          selectedSugar,
                          qty,
                          totalPrice,
                          note){
                        if (modelCartItem != null) {
                          notesController!.text = note;
                        }
                        return TextFormField(
                          controller:notesController,
                          maxLength: 30,
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor),
                          decoration: InputDecoration(
                            hintText: modelCartItem != null ? note :  'Add notes here..',
                            hintStyle: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                          ),
                        );
                      },
                    error: (message) => Center(
                      child: Text(message!),
                    ),
                  );

                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
