import 'package:flutter/material.dart';
import 'package:ch7_staggered_animations/widgets/animated_balloon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //Scaffold est une structure de base pour les applications Material Design
      body: SafeArea(
        //SafeArea évite que le contenu ne soit affiché sous la barre de statut ou de navigation
        child: SingleChildScrollView(
          //permet de faire défiler le contenu s'il est trop grand pour l'écran
          physics: NeverScrollableScrollPhysics(),
          //désactive le défilement pour éviter le défilement vertical
          child: Padding(
            padding: EdgeInsets.all(16.0),
            //Padding pour ajouter de l'éspace autour du contenu
            child: Column(
              children: [
                //affichage du ballon animé
                AnimatedBalloonWidget(),
              ],
            ),
            ),
        ),
        ),
    );
  }
}