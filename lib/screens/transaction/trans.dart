import 'package:flutter/material.dart';

class ScreenTrans extends StatelessWidget {
  const ScreenTrans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
              child: Text('25\ndec'),
            ),
            title: Text(' Travel'),
            subtitle: Text('rs 10000'),
          ),
        ),
        separatorBuilder: ((ctx, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemCount: 5,
      ),
    );
  }
}
