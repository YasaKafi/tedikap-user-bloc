import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';

import '../../../../../../common/theme.dart';

class CustomDropDown extends StatelessWidget {
  final String gender;
  final Function(String?) onChanged;

  const CustomDropDown({
    required this.gender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Center(child: CircularProgressIndicator());
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          loaded: (_, selectedOption, n) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: blackColor50),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: DropdownButton<String>(
                style: txtPrimarySubTitle.copyWith(
                    fontWeight: FontWeight.w500, color: blackColor),
                underline: Container(
                  height: 0,
                ),
                isExpanded: true,
                value: selectedOption,
                onChanged: (String? newValue) {
                  onChanged(newValue);
                  if (newValue != null) {
                    context.read<EditProfileBloc>().add(
                      EditProfileEvent.changeOption(newValue),
                    );
                  }
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                  );
                }).toList(),
              ),
            );
          },
          error: (message) {
            return Center(
              child: Text(
                message,
                style: txtSecondaryTitle.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
            );
          },
        );
      },
    );
  }
}

