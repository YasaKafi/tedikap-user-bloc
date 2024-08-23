import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../bloc/help_center_bloc.dart';
import '../widgets/accordion_help.dart';
import '../widgets/shimmer_help_center.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  void initState() {
    super.initState();
    context.read<HelpCenterBloc>().add(const HelpCenterEvent.getHelpCenter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: baseColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  top: 50, bottom: 10, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        context.pop();
                      } else {
                        print("Cannot pop");
                      }
                    },
                  ),
                  Text(
                    'Pusat Bantuan',
                    style: txtSecondaryHeader.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),
                  ),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            BlocBuilder<HelpCenterBloc, HelpCenterState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const  ShimmerHelpCenter(),
                  error: (message) => Center(child: Text(message)),
                  loaded: (isExpanded, model) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeLarge),
                      child: Column(
                        children: List.generate(
                          model.data!.length,
                              (index) {
                            final item = model.data![index];
                            return Column(
                              children: [
                                MyExpansionPanelItem(
                                  index: index,
                                  title: item.title!,
                                  content: item.subtitle!,
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                  orElse: () => const  ShimmerHelpCenter(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}






