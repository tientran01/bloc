import 'package:bloc_demo/bloc/information/bloc/information_bloc.dart';
import 'package:bloc_demo/bloc/information/bloc/information_event.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/information/bloc/information_state.dart';

class ShowInformationScreen extends StatelessWidget {
  const ShowInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show information"),
      ),
      body: BlocBuilder<InformationBloc, InformationState>(builder: (_, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            CustomButton(
              text: Constants.signOut,
              onTap: () =>
                  getIt.get<InformationBloc>().add(ClickButtonSignOutEvent()),
            )
          ],
        );
      }),
    );
  }
}
