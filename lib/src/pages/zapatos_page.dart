import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        CustomAppBar(title: 'For you'),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ShoesSizePreview(),
              ShoesDescription(
                title: 'Nike Air Max 720',
                description:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
            ],
          ),
        )),
        AddCarButton(monto: 180.0),
      ],
    )
        //ShoesSizePreview()
        //CustomAppBar(title: 'For you')
        );
  }
}
