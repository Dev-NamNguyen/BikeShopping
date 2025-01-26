import 'package:bike_shopping/res/app.context.extension.dart';
import 'package:bike_shopping/view/shared/active.icon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.resources.color.themeColor.withOpacity(0.85),
                      context.resources.color.themeColor,
                    ]),
              ),
            ),
          ),
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent, // Tắt hiệu ứng splash
              highlightColor: Colors.transparent, // Tắt hiệu ứng highlight
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.pedal_bike,
                      color: context.resources.color.bottomIconColor),
                  label: "",
                  activeIcon: ActiveIcon(
                      icon: const Icon(
                        Icons.pedal_bike,
                        color: Colors.white,
                      ),
                      resources: context.resources),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined,
                      color: context.resources.color.bottomIconColor),
                  label: "",
                  activeIcon: ActiveIcon(
                      icon: const Icon(
                        Icons.map_outlined,
                        color: Colors.white,
                      ),
                      resources: context.resources),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: context.resources.color.bottomIconColor),
                  label: "",
                  activeIcon: ActiveIcon(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      resources: context.resources),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline,
                      color: context.resources.color.bottomIconColor),
                  label: "",
                  activeIcon: ActiveIcon(
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      resources: context.resources),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document,
                      color: context.resources.color.bottomIconColor),
                  label: "",
                  activeIcon: ActiveIcon(
                      icon: const Icon(
                        Icons.edit_document,
                        color: Colors.white,
                      ),
                      resources: context.resources),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 20); // Góc trái trên
    path.lineTo(size.width, 0); // Góc phải trên
    path.lineTo(size.width, size.height); // Góc phải dưới (lùi vào 50px)
    path.lineTo(0, size.height); // Góc trái dưới (lùi vào 50px)
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
