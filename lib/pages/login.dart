import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = LoginBloc.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Login In",
                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                  CustomTextField(
                      title: "Username/Email",
                      hintText: "Enter your username",
                      suffixIcon: const Icon(Icons.email),
                      onChanged: (String email) => bloc.add(
                          GetUsernameAndPasswordFormTextFieldEvent(
                              username: email))),
                  CustomTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      onChanged: (String password) => bloc.add(
                          GetUsernameAndPasswordFormTextFieldEvent(
                              password: password))),
                  const SizedBox(height: 20.0),
                  CustomButton(text: "Login", onPressed: ()=> bloc.add(SubmitLoginEvent()), bgColor: Colors.blue,),
                  const SizedBox(height: 20.0),
                  Text(state.nameAndPassword ?? ''),
                ]),
          ),
        );
      }),
    );
  }
}
