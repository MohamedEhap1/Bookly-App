import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

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
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Image(
                  image: AssetImage(AssetsData.logo),
                ),
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),
          SlidingTextWidget(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // Get.to(() => const HomeView(),
        //     transition: Transition.fade, duration: kTransitionDuration);
        GoRouter.of(context).push(AppRoutes.kHomeView);
      },
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
