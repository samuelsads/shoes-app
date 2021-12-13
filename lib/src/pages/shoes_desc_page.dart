import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/shoes_model.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoesDescPage extends StatelessWidget {
  const ShoesDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag:'shoes-1',
              child: ShoesSizePreview(fullScreen: true)),
            Positioned(
              top:160,
              child: FloatingActionButton(
                elevation:0,
                highlightElevation: 0,
                backgroundColor:Colors.transparent,
              child:Icon(Icons.chevron_left,color: Colors.white, size:60),
              onPressed: (){
                cambiarStatusDark();
                Navigator.pop(context);
              }))
          ],
        ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ShadowButtom(Icons.star,1),
            _ShadowButtom(Icons.add_shopping_cart,2),
            _ShadowButtom(Icons.settings,3),
          ],
        ));
  }
}

class _ShadowButtom extends StatelessWidget {
  const _ShadowButtom(this.icon, this.index);

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final shoesModel  = Provider.of<ShoesModel>(context);
    return GestureDetector(
      onTap: (){
        shoesModel.selectShadowButtom = index;
        print('Presionando');
      },
      child: Container(
          child: Icon(icon, color: (shoesModel.selectShadowButtom  == index)? Colors.red:Colors.grey , size: 25),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: -5,
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ])),
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
              Positioned(left: 90, child: _ButtonColor(Color(0xffC6D642),4, 'assets/imgs/verde.png')),
              Positioned(left: 60, child: _ButtonColor(Color(0xffFFAD29),3, 'assets/imgs/amarillo.png')),
              Positioned(left: 30, child: _ButtonColor(Color(0xff2099F1),2, 'assets/imgs/azul.png')),
              Positioned(child: _ButtonColor(Color(0xff354d56),1,'assets/imgs/negro.png')),
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
  const _ButtonColor(this.color, this.index, this.urlImage);
  final Color color;
  final int index;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index *100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          final shoesModel = Provider.of<ShoesModel>(context, listen:false);
          shoesModel.assetImage = urlImage;
        },
        child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      ),
    );
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
              Bounce(
                delay: Duration(seconds: 1),
                from:8,
                child: ButtomOrange(text: 'Buy now', ancho: 120, alto: 40))
            ],
          )),
    );
  }
}
