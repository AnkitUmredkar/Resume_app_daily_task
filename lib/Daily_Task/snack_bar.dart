import 'package:flutter/material.dart';

class snackBar extends StatefulWidget {
  const snackBar({super.key});

  @override
  State<snackBar> createState() => _snackBarState();
}

class _snackBarState extends State<snackBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('SnackBar is Here'),
                  action: SnackBarAction(
                    label: 'Retry',
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: const Text(
              'Click Here To Show SnackBar',
              style: TextStyle(color: Colors.teal),
            ),
          ),
        ),
      ),
    );
  }
}
