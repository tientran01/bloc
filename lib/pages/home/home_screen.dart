import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/bloc/home/bloc/home_event.dart';
import 'package:bloc_demo/bloc/home/bloc/home_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/home/custom_name_section.dart';
import 'package:bloc_demo/component/home/custom_search.dart';
import 'package:bloc_demo/component/home/custom_slider.dart';
import 'package:bloc_demo/component/header_app_bar.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/pages/product/widgets/custom_product_item.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resource/app_route_name.dart';
import '../../router/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    getIt.get<HomeBloc>().add(const UpdateBadgeEvent());
  }

  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)?.settings.arguments as User?;
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: getIt<HomeBloc>(),
      builder: (_, state) {
        return Scaffold(
          backgroundColor: AppColor.hF9F9F9,
          appBar: HeaderAppBar(
            displayName: SharedPreferencesHelper.shared
                .getString(AppKeyName.displayName),
            email: SharedPreferencesHelper.shared.getString(AppKeyName.email),
            notificationCount: state.badge,
            onTap: () => NavigationService.navigatorKey.currentState
                ?.pushNamed(AppRouteName.notification),
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.size15,
                    ),
                    child: Column(
                      children: [
                        const CustomSlider(),
                        SizedBox(height: Constants.size20),
                        const CustomSearch(),
                        SizedBox(height: Constants.size20),
                        const CustomNameSection(
                          nameSection: AppStrings.category,
                        ),
                        const CustomNameSection(
                          nameSection: AppStrings.popularFood,
                        ),
                        SizedBox(
                          height: Constants.size200,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                const CustomProductItem(),
                          ),
                        ),
                        SizedBox(height: Constants.size20),
                        CustomButton(
                          text: AppStrings.signOut,
                          onTap: () => getIt.get<HomeBloc>().add(
                                SignOutEvent(),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
