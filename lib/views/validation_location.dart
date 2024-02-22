import 'package:flutter/material.dart';

class ValidationLocationArgument {
  final String routeNameNext;

  ValidationLocationArgument(this.routeNameNext);
}

class ValidationLocation extends StatelessWidget {
  static String routeName = 'validation_location';
  final String routeNameNext;

  const ValidationLocation(this.routeNameNext, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Confirmation ok',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
