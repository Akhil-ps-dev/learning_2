import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (ctx, index) => SizedBox(
                  height: 10,
                ),
            separatorBuilder: ((ctx, index) => ListTile(
                  title: Text("INCOME $index"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                )),
            itemCount: 23));
  }
}
