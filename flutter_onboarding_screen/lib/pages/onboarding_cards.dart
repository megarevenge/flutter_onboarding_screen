import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingCards extends StatefulWidget {
  final PageController controller;
  final int currentPage;

  const OnboardingCards({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  State<OnboardingCards> createState() => _OnboardingCardsState();
}

class _OnboardingCardsState extends State<OnboardingCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: widget.currentPage != 2,
                  maintainSize: true, 
                  maintainAnimation: true, 
                  maintainState: true, 
                  child: TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Page ${widget.currentPage + 1}',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
