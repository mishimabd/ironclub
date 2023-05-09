import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings Page',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SettingsPage(),
      ),
    );
  }
}

class Sett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

class ProfileImageAndButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Your action here
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info, color: Colors.black, size: 24),
          SizedBox(width: 8),
          Text(
            'Clickable Text',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Settings'),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Column(
            children: [
            Text('Settings', style: TextStyle(color: Colors.black, fontSize: 18)),
        Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.cases_outlined),
                            Expanded(
                              child: Text(
                                'Company Information',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Colors.black,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.wallet),
                            Expanded(
                              child: Text(
                                'Payment Information',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Colors.black,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.lock_open),
                            Expanded(
                              child: Text(
                                'Confidential policy',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Colors.black,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.exit_to_app),
                          Expanded(
                            child: Text(
                              'Log Out',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.black,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Действия при нажатии на кнопку "Log Out"
                      },
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    ),
    );
  }
}