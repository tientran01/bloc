import 'package:bloc_demo/bloc/demo/bloc/demo_bloc.dart';
import 'package:bloc_demo/bloc/demo/bloc/demo_event.dart';
import 'package:bloc_demo/bloc/demo/bloc/demo_state.dart';
import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoBlocScreen extends StatefulWidget {
  const DemoBlocScreen({Key? key}) : super(key: key);

  @override
  State<DemoBlocScreen> createState() => _DemoBlocScreenState();
}

class _DemoBlocScreenState extends State<DemoBlocScreen> {
  late DemoBloc demoBloc;
  @override
  void initState() {
    demoBloc = DemoBloc.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.blocDemo,
      ),
      body: BlocBuilder<DemoBloc, DemoState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: AppStrings.getDataById,
                  onTap: () => demoBloc.add(
                    const GetDataByIdEvent(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: AppStrings.getDataByUserId,
                  onTap: () => demoBloc.add(
                    const GetDataByUserIdEvent(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: AppStrings.demoCubit,
                  onTap: () => demoBloc.add(
                    ClickButtonDemoCubitEvent(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: AppStrings.demoGetX,
                  onTap: () => demoBloc.add(
                    ClickButtonDemoGetXEvent(),
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
