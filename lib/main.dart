//
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OnboardingScreen(),
//     );
//   }
// }
//
// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer to auto-scroll every 5 seconds
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (_currentIndex < 3) {
//         _currentIndex++;
//       } else {
//         _currentIndex = 0;
//       }
//       _pageController.animateToPage(
//         _currentIndex,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         children: [
//           Image.asset(
//             'assets/onboarding1.png', // أضف الصور هنا
//             fit: BoxFit.cover,
//           ),
//           Image.asset(
//             'assets/onboarding2.png',
//             fit: BoxFit.cover,
//           ),
//           Image.asset(
//             'assets/onboarding3.png',
//             fit: BoxFit.cover,
//           ),
//           Image.asset(
//             'assets/onboarding4.png',
//             fit: BoxFit.cover,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppScreensViewer(),
    );
  }
}

class AppScreensViewer extends StatefulWidget {
  @override
  _AppScreensViewerState createState() => _AppScreensViewerState();
}

class _AppScreensViewerState extends State<AppScreensViewer> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  // List of image paths (Add your images here)
  final List<String> _imagePaths = [
    'assets/onboarding1.png',
    'assets/onboarding2.png',
    'assets/onboarding3.png',
    'assets/onboarding4.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
  ];

  @override
  void initState() {
    super.initState();
    // Start the timer to auto-scroll every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < _imagePaths.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(
            _imagePaths[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
