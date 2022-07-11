import 'package:bloc_demo/bloc/information/bloc/information_bloc.dart';
import 'package:bloc_demo/bloc/information/bloc/information_event.dart';
import 'package:bloc_demo/bloc/information/bloc/information_state.dart';
import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_show_profile.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUserScreen extends StatelessWidget {
  const ShowUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)?.settings.arguments as User;
    return BlocBuilder<InformationBloc, InformationState>(builder: (_, state) {
      return Scaffold(
          appBar: const CustomAppBar(
            title: AppStrings.profile,
          ),
          body: CustomShowProfile(
            photoURL: user.phoneNumber,
            displayName: user.displayName,
            email: user.email,
            phoneNumber: user.phoneNumber,
            onPressed: () => getIt.get<InformationBloc>().add(SignOutEvent()),
          ));
    });
  }
}
