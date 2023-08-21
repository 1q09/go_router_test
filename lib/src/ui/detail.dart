import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: Text("Go Back Home"),
      )),
    );
  }
}
