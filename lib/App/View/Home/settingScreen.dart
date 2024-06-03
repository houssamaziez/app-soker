import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomlogin/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:tomlogin/App/util/Route/go.dart';

class AppSettingsScreen extends StatefulWidget {
  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool _notificationsEnabled = false;
  bool _darkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications') ?? false;
      _darkModeEnabled = prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _updateSettings(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool(key, value);
    });
  }

  void _changeTheme(bool value) {
    setState(() {
      _darkModeEnabled = value;
      _updateSettings('darkMode', value);
    });
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
      _updateSettings('notifications', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: _toggleNotifications,
          ),
          SwitchListTile(
            title: Text('Vibration'),
            value: _darkModeEnabled,
            onChanged: _changeTheme,
          ),
          ListTile(
            title: Text('Account Preferences'),
            onTap: () {
              // Navigate to account preferences screen
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy screen
            },
          ),
          ListTile(
            title: Text('Terms of Service'),
            onTap: () {
              // Navigate to terms of service screen
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Go.to(context, ScreenSignin());
            },
            child: Text('Log Out'),
            style: ElevatedButton.styleFrom(),
          ),
        ],
      ),
    );
  }
}
