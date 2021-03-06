import 'package:bloc_demo/bloc/information/bloc/information_bloc.dart';
import 'package:bloc_demo/bloc/information/bloc/information_event.dart';
import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/information/bloc/information_state.dart';

class ShowInformationScreen extends StatelessWidget {
  const ShowInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.profile,
      ),
      body: BlocBuilder<InformationBloc, InformationState>(
        builder: (_, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.size30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: AppStrings.signOut,
                  onTap: () => getIt.get<InformationBloc>().add(
                        SignOutEvent(),
                      ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
