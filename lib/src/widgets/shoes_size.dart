import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/models/shoes_model.dart';
import 'package:shoes/src/pages/shoes_desc_page.dart';

class ShoesSizePreview extends StatelessWidget {
  ShoesSizePreview({this.fullScreen = false});

  bool fullScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        if(!this.fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ShoesDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 10 : 0),
        child: Container(
            width: double.infinity,
            height: (fullScreen) ? 420 : 430,
            decoration: BoxDecoration(
                color: Color(0xffFFCF53),
                borderRadius: (!fullScreen)
                    ? BorderRadius.circular(50)
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
            child: Column(
              children: <Widget>[
                _ShoesWithShadow(),
                if (!fullScreen) _ShoesSizes(),
              ],
            )),
      ),
    );
  }
}

class _ShoesSizes extends StatelessWidget {
  const _ShoesSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SizeShoesBox(7),
          _SizeShoesBox(7.5),
          _SizeShoesBox(8),
          _SizeShoesBox(8.5),
          _SizeShoesBox(9),
          _SizeShoesBox(9.5),
        ],
      ),
    );
  }
}

class _SizeShoesBox extends StatelessWidget {
  final double numero;

  _SizeShoesBox(this.numero);

  @override
  Widget build(BuildContext context) {

    final shoesModel = Provider.of<ShoesModel>(context);
    return GestureDetector(
      onTap: (){
        final shoesModel = Provider.of<ShoesModel>(context, listen: false);
        shoesModel.talla = this.numero;
      },
      child: Container(
          alignment: Alignment.center,
          child: Text('${numero.toString().replaceAll('.0', '')}',
              style: TextStyle(
                  color: (numero == shoesModel.talla) ? Colors.white : Color(0xffF1A23A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              boxShadow: [
                //TODO: Pendiente
                if (this.numero == shoesModel.talla)
                  BoxShadow(
                      color: Color(0xffF1A23A),
                      blurRadius: 10,
                      offset: Offset(0, 5))
              ],
              color: (numero == shoesModel.talla) ? Color(0xffF1A23A) : Colors.white,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}

class _ShoesWithShadow extends StatelessWidget {
  const _ShoesWithShadow({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final shoesModel = Provider.of<ShoesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 20, right: 0, child: _ShoesShadow()),
          Image(image: AssetImage(shoesModel.assetImage))
        ],
      ),
    );
  }
}

class _ShoesShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
          width: 230,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
              ])),
    );
  }
}
