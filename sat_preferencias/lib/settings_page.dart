import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkThemeEnabled = false;
  double _fontSize = 16.0;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Dark Theme'),
              value: _darkThemeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkThemeEnabled = value;
                });
                // Pode adicionar lógica aqui para alterar o tema
              },
            ),
            SizedBox(height: 20),
            Text(
              'Font Size:',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _fontSize,
              min: 12,
              max: 24,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
                // Pode adicionar lógica aqui para alterar o tamanho da fonte
              },
            ),
            SizedBox(height: 20),
            Text(
              'Language:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
                // Pode adicionar lógica aqui para alterar o idioma
              },
              items: <String>['English', 'Spanish', 'Portuguese', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
