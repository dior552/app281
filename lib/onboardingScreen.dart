import 'package:app281/homePage.dart';
import 'package:app281/introScreens/introScreen1.dart';
import 'package:app281/introScreens/introScreen2.dart';
import 'package:app281/introScreens/introScreen3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget{
  const onBoardingScreen({Key? key}) : super (key: key);

  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  //controlador para paginas
  PageController _controller = PageController();

  //verificar si es la ultima pagina o no
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //vista de paginas
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              introPage1(),
              introPage2(),
              introPage3(),
            ],
          ),

          //indicadores de puntos
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //atras
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);//modificar para salir de la aplicacion u otra wea
                  },
                  child: Text("Atrás")
                ),

                //indicador de punto
                SmoothPageIndicator(controller: _controller, count: 3),
                
                //siguiente o hecho
                onLastPage 
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                  child: Text("Hecho")
                  )
                  : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500), 
                        curve: Curves.easeIn,
                      );
                    },
                  child: Text("Siguiente")
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}