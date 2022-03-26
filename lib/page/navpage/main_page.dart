import 'package:flutter/material.dart';
import 'package:sneaker/page/home_page.dart';
import 'package:sneaker/page/navpage/cart_page.dart';
import 'package:sneaker/page/navpage/favorite_page.dart';
import 'package:sneaker/page/navpage/profile_page.dart';
import 'package:sneaker/theme/color.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    FavooritePage(),
    CartPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;
  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: backgroundColor,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 75,
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor1.withOpacity(0.5).withAlpha(90),
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: ontap,
          currentIndex: currentIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: primaryColor,
          unselectedItemColor: accentColor,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 20,
                      height: 24,
                      color: currentIndex == 0 ? primaryColor : textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  currentIndex == 0
                      ? Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/icon_heart.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 1 ? primaryColor : textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  currentIndex == 1
                      ? Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/icon_cart.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 2 ? primaryColor : textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  currentIndex == 2
                      ? Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: currentIndex == 2
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/icon_person.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 3 ? primaryColor : textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  currentIndex == 3
                      ? Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: currentIndex == 3
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
