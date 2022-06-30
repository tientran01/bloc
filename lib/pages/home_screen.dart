import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/bloc/home/bloc/home_event.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC DEMO"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Get Data By Id",
              onTap: () => homeBloc.add(const GetDataByIdEvent()),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
                text: "Get Data By UserId",
                onTap: () => homeBloc.add(const GetDataByUserIdEvent())),
            const SizedBox(height: 20.0),
            CustomButton(
              text: "Demo Cubit",
              onTap: () => homeBloc.add(ClickButtonDemoCubitEvent()),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              text: "Demo GetX",
              onTap: () => homeBloc.add(ClickButtonDemoGetXEvent()),
            )
          ],
        );
      }),
    );
  }
}
