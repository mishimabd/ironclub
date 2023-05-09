import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Страница оплаты',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey,
          selectionHandleColor: Color(0xff961b56),
          cursorColor: Color(0xff961b56),
        ),
        textButtonTheme: TextButtonThemeData(

          style: TextButton.styleFrom(
            primary: Color(0xff014131), // цвет текста
            backgroundColor: Colors.white, // цвет фона
            textStyle: TextStyle(color: Color(0xff014131)), // стиль текста
            // другие свойства
            // ...
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(

          // настройки рамки


          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff961b56)),
          ),
          // настройки подсказки
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        // другие настройки
        // ...


      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

              Image.asset('assets/images/icon.png', width: 40, height: 40),
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
      appBar: AppBar(
        title: Text("Способ оплаты"),
        backgroundColor: Color(0xff014131),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton (

              child: Text("Оплата картой"),

              onPressed: () {
                _showDialog();
              },
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Color(0xff014131)),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Color(0xff014131)),
                minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey),
                    )
                ),
              ),
            ),
            if (_isDialogVisible)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

}
