import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key, required this.secilenSehir})
      : super(key: key);

  final String secilenSehir;

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
