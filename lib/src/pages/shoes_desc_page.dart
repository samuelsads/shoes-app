import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoesDescPage extends StatelessWidget {
  const ShoesDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ShoesSizePreview(fullScreen: true),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ShoesDescription(
                title: 'Nike Air Max 720',
                description:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _AmountBuyNow(),
              _ColorsAndMore(),
              _ButtomLikeCardSettings()
            ],
          ),
        )),
      ],
    ));
  }
}

class _ButtomLikeCardSettings extends StatelessWidget {
  const _ButtomLikeCardSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: _ShadowButtom(Icon(Icons.star, color: Colors.red, size: 25)),
    );
  }
}

class _ShadowButtom extends StatelessWidget {
  const _ShadowButtom(this.icon);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            child: icon,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: -5,
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]))
      ],
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(left: 90, child: _ButtonColor(Color(0xffC6D642))),
              Positioned(left: 60, child: _ButtonColor(Color(0xffFFAD29))),
              Positioned(left: 30, child: _ButtonColor(Color(0xff2099F1))),
              Positioned(child: _ButtonColor(Color(0xff354d56))),
            ],
          )),
          ButtomOrange(
              text: 'More related items',
              alto: 30,
              ancho: 170,
              color: Color(0xffFFC675)),
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  const _ButtonColor(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _AmountBuyNow extends StatelessWidget {
  const _AmountBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$189.0',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ButtomOrange(text: 'Buy now', ancho: 120, alto: 40)
            ],
          )),
    );
  }
}
