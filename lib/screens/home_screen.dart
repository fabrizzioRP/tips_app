import 'package:flutter/material.dart';
import 'package:options_app/widgets/button_move_screen.dart';

import '../models/content.dart';
import '../widgets/content_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double _currentIndex = 0;
  bool buttonFinished = false;
  bool buttonBack = false;
  final duration = const Duration(milliseconds: 600);

  @override
  void initState() {
    pageController = PageController(initialPage: _currentIndex.toInt());

    pageController.addListener(() {
      setState(() {
        _currentIndex = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white60,
      body: SafeArea(
        child: Stack(
          children: [
            // INDICATOR SCREEN
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 30,
                width: size.width,
                alignment: Alignment.center,
                child: _Ovalindicatorscreen(currentScreen: _currentIndex),
              ),
            ),
            // CONTENT SCREEN
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contentScreens.length,
              itemBuilder: (_, i) => ContentWidget(
                size: size,
                contenido: contentScreens[i],
              ),
            ),
            // BUTTON NEXT
            Positioned(
              bottom: 20,
              right: 30,
              child: GestureDetector(
                onTap: tapNextScreen,
                child: ButtonMoveScreen(
                    icon: (buttonFinished)
                        ? Icons.home_filled
                        : Icons.arrow_forward_ios),
              ),
            ),
            // BUTTON BACK
            if (buttonBack)
              Positioned(
                bottom: 20,
                left: 30,
                child: GestureDetector(
                  onTap: tapBackScreen,
                  child: const ButtonMoveScreen(icon: Icons.arrow_back_ios),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void tapNextScreen() {
    if (_currentIndex >= 0.0 && _currentIndex <= 1.8) {
      pageController.animateToPage(_currentIndex.toInt() + 1,
          duration: duration, curve: Curves.easeIn);
      if (_currentIndex == 1.0) {
        setState(() {
          buttonFinished = true;
          buttonBack = true;
        });
      }
    }
  }

  void tapBackScreen() {
    pageController.animateToPage(
      _currentIndex.toInt() - 1,
      duration: duration,
      curve: Curves.easeOut,
    );
    setState(() {
      buttonFinished = false;
    });
    if (_currentIndex == 1.0) {
      setState(() {
        buttonBack = false;
      });
    }
  }
}

class _Ovalindicatorscreen extends StatelessWidget {
  const _Ovalindicatorscreen({Key? key, required this.currentScreen})
      : super(key: key);
  final double currentScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        contentScreens.length,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height:
              ((contentScreens[i].id - 1) == currentScreen.toInt()) ? 15 : 10,
          width: 35,
          decoration: BoxDecoration(
            color: ((contentScreens[i].id - 1) == currentScreen.toInt())
                ? Colors.black
                : Colors.black38,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
