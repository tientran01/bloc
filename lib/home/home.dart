import 'package:bloc_demo/home/bloc/restaurant_bloc.dart';
import 'package:bloc_demo/home/bloc/restaurant_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/restaurant_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RestaurantBloc bloc;
  String? name;

  @override
  void initState() {
    bloc = RestaurantBloc.of(context);
    bloc.add(LoadApiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantBloc, RestaurantState>(builder: (_, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Login In"),
              TextFormField(
                onChanged: (String value) =>
                    bloc.add(GetDataFromTextFieldEvent(value: value)),
              ),
              TextFormField(
                onChanged: (String password) =>
                    bloc.add(GetPasswordFromTextFieldEvent(password)),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () => bloc.add(ShowUserNameAndPasswordEvent()),
                child: Container(
                    height: 56,
                    color: Colors.amber,
                    child: Center(child: Text("Login"))),
              ),
              Text(state.nameAndPassword ?? ''),
            ]),
          ),
        );
      }),
    );
  }

  void createShowSnackBar(String msg) {
    final snackBar = SnackBar(content: Text(msg));

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
