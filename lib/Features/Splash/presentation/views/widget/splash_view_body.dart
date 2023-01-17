
import 'package:bookly/Features/Splash/presentation/views/widget/sliding_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/assets.dart';




class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation,),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }



  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
       GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }

}




