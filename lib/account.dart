import 'package:flutter/material.dart';
import 'package:ironclub/settings.dart';
import 'package:ironclub/user.dart';
import 'package:flutter/services.dart';

class ProfileImageAndButtons extends StatefulWidget {
  @override
  State<ProfileImageAndButtons> createState() => _ProfileImageAndButtonsState();
}

class _ProfileImageAndButtonsState extends State<ProfileImageAndButtons> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  child: Icon(Icons.settings),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Image.asset(
                'images/card_image.png',
                height: 200,
                width: 300,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size(145, 40)),
                ),
                child: Text('Extend',
                    style: TextStyle(color: Colors.black)
                ),

                onPressed: () {
                  // Actions when pressing button 1
                },
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size(140, 40)),
                ),
                child: Text('Freeze',
                    style: TextStyle(color: Colors.black)
                ),
                onPressed: () {
                  // Actions when pressing button 2
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _isDialogVisible = false;

  TextEditingController _expiryDateController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          title: Row(
            children: [
              Text('Страница оплаты'),
              SizedBox(width: 20),

              Image.asset('images/icon.png', width: 40, height: 40),
            ],
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Номер карты',
                  floatingLabelBehavior: FloatingLabelBehavior.always, // изменение расположения hintText
                  hintText: '1234 5678 9012 3456',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      onChanged: (value) {
                        if (value.length == 2 && !_expiryDateController.text.contains('/')) {
                          _expiryDateController.text = _expiryDateController.text + '/';
                          _expiryDateController.selection = TextSelection.fromPosition(TextPosition(offset: _expiryDateController.text.length));
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'MM/YY',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "MM/YY",
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "CVV",
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Отмена"),
              onPressed: () {
                setState(() {
                  _isDialogVisible = false;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Подтвердить"),
              onPressed: () {
                // Действия при подтверждении
                setState(() {
                  _isDialogVisible = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      // Обработка результата
      print("Dialog result: $value");
    });

    setState(() {
      _isDialogVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileImageAndButtons(),
            SizedBox(height: 20),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.payment, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Payment',
                        style: TextStyle(color: Colors.black)
                    ),
                  ],
                ),
                onPressed: () {
                  _showDialog();
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Notifications',
                        style: TextStyle(color: Colors.black)
                    ),
                  ],
                ),
                onPressed: () {
                  // Действия при нажатии на кнопку 2
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Support',
                        style: TextStyle(color: Colors.black)
                    ),
                  ],
                ),
                onPressed: () {

                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Log Out',
                        style: TextStyle(color: Colors.black)
                    ),
                  ],
                ),
                onPressed: () {
                  // Действия при нажатии на кнопку 4
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



