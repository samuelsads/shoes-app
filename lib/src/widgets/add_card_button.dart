import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class AddCarButton extends StatelessWidget {
  AddCarButton({Key? key, required this.monto}) : super(key: key);

  final double monto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('\$$monto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ButtomOrange(
            text: 'Add to car',
          ),
        ],
      ),
    );
  }
}
