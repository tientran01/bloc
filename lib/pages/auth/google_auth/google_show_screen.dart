import 'package:bloc_demo/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_show_profile.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/bloc/login_state.dart';

class GoogleShowScreen extends StatelessWidget {
  const GoogleShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Constants.profile,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return CustomShowProfile(
            email: user.email,
            displayName: user.displayName,
            photoURL: user.photoURL,
            onPressed: () => getIt.get<LoginBloc>().add(
                  SignOutEvent(),
                ),
          );
        },
      ),
    );
  }
}
