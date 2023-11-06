import 'package:contact_dairy_app/utils/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              image: const FlutterLogo(size: 150,),
              bodyWidget: const Column(
                children: [
                  Text("Page1 is Comming Soon"),
                ],
              ),
              titleWidget: const Text("Page1"),
            ),
            PageViewModel(
              image: const FlutterLogo(size: 150,),
              bodyWidget: const Column(
                children: [
                  Text("Page2 is Comming Soon"),
                ],
              ),
              titleWidget: const Text("Page2"),
            ),
            PageViewModel(
              image: const FlutterLogo(size: 150,),
              bodyWidget: const Column(
                children: [
                  Text("Page3 is Comming Soon"),
                ],
              ),
              titleWidget: const Text("Page3"),
            ),
          ],
          showNextButton: true,
          next: const Text("Next"),
          showDoneButton: true,
          done: const Text("Done"),
          onDone: () {
              ShareHelper shareHelper =ShareHelper();
              shareHelper.setIntroStatus();
              Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
    );
  }
}
