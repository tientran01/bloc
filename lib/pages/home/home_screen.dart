import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/bloc/home/bloc/home_event.dart';
import 'package:bloc_demo/bloc/home/bloc/home_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/header_app_bar.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)?.settings.arguments as User?;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Scaffold(
          appBar: HeaderAppBar(
            displayName: user?.displayName,
            email: user?.email,
            photoURL: user?.photoURL,
            onTap: () => getIt.get<HomeBloc>().add(ShowProfileEvent(
              user: user
            )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.size30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: AppStrings.signOut,
                  onTap: () => getIt.get<HomeBloc>().add(SignOutEvent()),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
