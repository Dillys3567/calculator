// ignore_for_file: prefer_const_constructors
import 'package:calculator/utils/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showOptions = false;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText2?.color,
              fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                showOptions = !showOptions;
              });
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Theme',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1?.color,
                fontSize: 20,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Colors.grey, width: 0.1)),
          ),
          Offstage(
            offstage: showOptions,
            child: Column(
              children: [
                RadioListTile(
                    title: Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                    value: ThemeMode.dark,
                    groupValue: themeChange.darkTheme,
                    onChanged: (value) {
                      setState(() {
                        themeChange.darkTheme = ThemeMode.dark;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'Light Mode',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                    value: ThemeMode.light,
                    groupValue: themeChange.darkTheme,
                    onChanged: (value) {
                      setState(() {
                        themeChange.darkTheme = ThemeMode.light;
                      });
                    }),
                RadioListTile(
                    title: Text(
                      'System Theme',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                    value: ThemeMode.system,
                    groupValue: themeChange.darkTheme,
                    onChanged: (value) {
                      setState(() {
                        themeChange.darkTheme = ThemeMode.system;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
