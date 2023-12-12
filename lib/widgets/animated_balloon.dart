import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  State<AnimatedBalloonWidget> createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState(){
    super.initState();

    //Créer une AnimationCondtroller avec vsync pointant vers l'état du widget
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      );
  }

  @override
  void dispose(){

    //On s'assure de libérer les ressources du contrôlleur d'animation
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Calcul des dimanesions initiales du ballon
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.width / 3;
    double _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight;

    //Configuration de l'animation pour la montée du ballon
    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: const Interval(0.0, 1.0, curve:  Curves.fastOutSlowIn))
    );

    //configuration de l'anilation pour la taille du ballon
    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut))
    );
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        //Utilisation des valeurs d'animation pour déplacer et redimensionner le ballon
        return Container(
          margin: EdgeInsets.only(top : _animationFloatUp.value),
          width: _animationGrowSize.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          //Inverser l'animation lorsqu'on appuie sur le ballon
          if(_controller.isCompleted){
            _controller.reverse();
          }
          else{
            _controller.forward();
          }
        },
        child: Image.asset('assets/images/Beginning-GoogleFlutter-Balloon.png', height: _balloonHeight, width: _balloonWidth,),
      ),
    );
  }
}