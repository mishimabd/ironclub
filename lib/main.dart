import 'package:flutter/material.dart';
import 'package:ironclub/account.dart';
import 'package:ironclub/calendar.dart';
import 'package:ironclub/exercises.dart';
import 'package:ironclub/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Color(0xff014131)
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Color color = Color(0xff014131);
  Color colorSelected = Colors.white;
  final screens = [
    HomePage(),
    Calendar(),
    Exercises(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color(0xff961b56),
            backgroundColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => {
            setState(() => {this.index = index})
          },
          height: 60,
          elevation: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: index == 0 ? Colors.white : color, // Update color for selected icon
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.calendar_month,
                color: index == 1 ? Colors.white : color, // Update color for selected icon
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.sports_gymnastics,
                color: index == 2 ? Colors.white : color, // Update color for selected icon
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: index == 3 ? Colors.white : color, // Update color for selected icon
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
