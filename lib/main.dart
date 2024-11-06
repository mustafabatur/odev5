import 'package:flutter/material.dart';

void main() {
  runApp(ThemeToggleApp());
}

class ThemeToggleApp extends StatefulWidget {
  @override
  _ThemeToggleAppState createState() => _ThemeToggleAppState();
}

class _ThemeToggleAppState extends State<ThemeToggleApp> {
  bool _isDarkModeEnabled = false;

  // Light Theme Configuration
  final ThemeData _lightThemeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge:
          TextStyle(color: Colors.black, fontSize: 18), // Güncel TextStyle
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Yuvarlatılmış köşeler
        ),
      ),
    ),
  );

  // Dark Theme Configuration
  final ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      bodyLarge:
          TextStyle(color: Colors.white, fontSize: 18), // Güncel TextStyle
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Dik köşeler
        ),
      ),
    ),
  );

  // Toggle theme mode
  void _toggleThemeMode() {
    setState(() {
      _isDarkModeEnabled = !_isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkModeEnabled ? _darkThemeData : _lightThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tema Değiştirme',
            style: TextStyle(
              color: _isDarkModeEnabled
                  ? Colors.white
                  : Colors.black, // Başlık yazısı rengini ayarla
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Şu anki tema: ${_isDarkModeEnabled ? "Karanlık" : "Açık"}',
                style: TextStyle(
                  color: _isDarkModeEnabled
                      ? Colors.white
                      : Colors.black, // Yazı rengi
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleThemeMode,
                child: Text(
                  'Temayı Değiştir',
                  style: TextStyle(
                    color: _isDarkModeEnabled
                        ? Colors.white
                        : Colors.black, // Buton içindeki yazı rengi
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
