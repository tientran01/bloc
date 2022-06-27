import 'package:bloc_demo/cubit/demo/demo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoCubitScreen extends StatefulWidget {
  const DemoCubitScreen({Key? key}) : super(key: key);

  @override
  State<DemoCubitScreen> createState() => _DemoCubitScreenState();
}

class _DemoCubitScreenState extends State<DemoCubitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Cubit"),
      ),
      body: BlocBuilder<DemoCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text('$state'),
          );
        }
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<DemoCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<DemoCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
