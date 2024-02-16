import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'HAPPY NEW YEAR',
                  style: GoogleFonts.pressStart2p(
                    textStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: TypeWriterText(
                    repeat: true,
                    text: Text(
                      '2024 .',
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 120,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
              ),
              const Image(
                image: AssetImage(
                  'assets/crt.gif',
                ),
              ),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.directional,
          blastDirection: pi * 2,
          emissionFrequency: 0.1,
          numberOfParticles: 10,
          maxBlastForce: 130,
          gravity: 0.3,
          colors: const [
            Colors.red,
            Colors.green,
            Colors.yellow,
            Colors.blue,
            Colors.orange,
            Colors.purple,
            Colors.brown,
            Colors.purpleAccent,
            Colors.teal,
            Colors.black,
          ],
          createParticlePath: (size) {
            double degToRad(double deg) => deg * (pi / 180.0);

            const numberOfPoints = 10;
            final halfWidth = size.width / 2;
            final externalRadius = halfWidth;
            final internalRadius = halfWidth / 2.5;
            final degreesPerStep = degToRad(360 / numberOfPoints);
            final halfDegreesPerStep = degreesPerStep / 2;
            final path = Path();
            final fullAngle = degToRad(360);
            path.moveTo(size.width, halfWidth);

            for (double step = 0; step < fullAngle; step += degreesPerStep) {
              path.lineTo(halfWidth + externalRadius * cos(step),
                  halfWidth + externalRadius * sin(step));
              path.lineTo(
                  halfWidth + internalRadius * cos(step + halfDegreesPerStep),
                  halfWidth + internalRadius * sin(step + halfDegreesPerStep));
            }
            path.close();
            return path;
          },
        ),
      ],
    );
  }
}
