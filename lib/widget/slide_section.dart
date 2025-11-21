import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pharmacy_task/color_section/color.dart';

class SlideSection extends StatefulWidget {
  const SlideSection({super.key});

  @override
  AutoSliderState createState() => AutoSliderState();
}

class AutoSliderState extends State<SlideSection> {
  late PageController pageController;
  int currentPage = 0;
  Timer? timer;

  final List<String> slides = ["Slide 1", "Slide 2", "Slide 3", "Slide 4"];

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      if (!pageController.hasClients) return;

      currentPage = (currentPage + 1) % slides.length;

      try {
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ); 
      } catch (e) { }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, 
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE6E6), Color(0xFFF5A0A0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    slides[index],
                    style: const TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: List.generate(
                slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 9,
                  width: currentPage == index ? 12 : 10,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.iconColor
                        : AppColors.textColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
