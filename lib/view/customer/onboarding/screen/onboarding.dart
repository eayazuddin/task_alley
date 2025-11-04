import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_alley/gen/assets.gen.dart';
import 'package:task_alley/view/screens/base/screen/base.dart';
import '../widget/custom_onboarding.dart';

class CusOnboardingScreen extends StatefulWidget {
  const CusOnboardingScreen({super.key});

  @override
  State<CusOnboardingScreen> createState() => _CusOnboardingScreenState();
}

class _CusOnboardingScreenState extends State<CusOnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      // isLastPage ?  '': AppStrings.skip,
                      "Skip",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Page view for onboarding pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  OnboardingPage(
                    title: "Find Trusted Services Instantly",
                    description: "Browse and book reliable service providers in your area — anytime, anywhere, with just a few taps.",
                    imagePath: Assets.images.onboarding1.path,
                    pageNumber: '01',
                  ),
                  OnboardingPage(
                    title: "Real-Time Booking & Tracking",
                    description: "Schedule services at your convenience and track progress in real time — from confirmation to completion.",
                    imagePath: Assets.images.onboarding2.path,
                    pageNumber: '02',
                  ),
                  OnboardingPage(
                    title: "Secure Payments & Verified Reviews",
                    description: "Pay with confidence through secure gateways and make informed decisions by reading real user reviews.",
                    imagePath: Assets.images.onboarding3.path,
                    pageNumber: '03',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 230.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF115E59),
                  dotColor: Colors.grey,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  spacing: 4.w,
                  expansionFactor: 3.r,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF115E59),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          Get.off(const Base());
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLastPage ? 'Continue' : 'Next',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            isLastPage
                                ? Icons.arrow_forward
                                : Icons.arrow_forward,
                            size: 16.r,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Page indicator
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
