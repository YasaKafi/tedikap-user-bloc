import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/bloc/help_center_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class MyExpansionPanelItem extends StatelessWidget {
  final int index;
  final String title;
  final String content;

  const MyExpansionPanelItem({super.key,
    required this.index,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterBloc, HelpCenterState>(
  builder: (context, state) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionPanelList(
          dividerColor: Colors.transparent,
          expansionCallback: (panelIndex, isExpanded) {
            context.read<HelpCenterBloc>().add(HelpCenterEvent.togglePanel(index));
          },
          children: [
            ExpansionPanel(
              backgroundColor: baseColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.paddingSizeDefault,
                      bottom: state.isExpanded[index] ? 0 : Dimensions.paddingSizeDefault,
                      left: Dimensions.paddingSizeDefault),
                  child: Text(
                    title,
                    style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                  ),
                );
              },
              body: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.only(left: Dimensions.paddingSizeDefault,
                    bottom: Dimensions.paddingSizeDefault,),
                child: Text(content),
              ),
              isExpanded: state.isExpanded[index],
            ),
          ],
        ),
    );
  },
);
  }
}
