import 'package:bloc_demo/model/data.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Data> datas = ModalRoute.of(context)?.settings.arguments as List<Data>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile screen"),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: datas.length,
          itemBuilder: (context, index) => Dismissible(
              key: ValueKey<Data>(datas.elementAt(index)),
              background: Container(
                color: Colors.blueAccent,
              ),
              child: _buildDataItem(datas.elementAt(index)))),
    );
  }

  Widget _buildDataItem(Data data) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("userId: ${data.userId}"),
              Text("id: ${data.id}"),
              Text("title: ${data.title}"),
              Text("body; ${data.body}")
            ]),
      );
}
