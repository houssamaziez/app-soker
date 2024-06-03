import 'package:flutter/material.dart';
import 'package:tomlogin/App/View/Home/screenEdite.dart';
import 'package:tomlogin/App/View/Home/settingScreen.dart';
import '../../Model/user.dart';
import '../../util/Route/go.dart';

class UserProfileScreen extends StatelessWidget {
  final UserData userData;

  UserProfileScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    final user = userData.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
            onPressed: () {
              Go.to(context, AppSettingsScreen());
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                Go.to(
                    context,
                    EditUserProfileScreen(
                      userData: userData,
                    ));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? Center(
                child: Text(
                  'No user data available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileHeader(user.name ?? 'N/A'),
                    SizedBox(height: 20),
                    _buildProfileCard('ID', user.id?.toString() ?? 'N/A',
                        Icons.perm_identity),
                    _buildProfileCard(
                        'Email', user.email ?? 'N/A', Icons.email),
                    _buildProfileCard(
                        'Wilaya', user.wilaya ?? 'N/A', Icons.location_city),
                    _buildProfileCard('Created At', user.createdAt ?? 'N/A',
                        Icons.calendar_today),
                    _buildProfileCard('Expiration date',
                        user.updatedAt ?? 'N/A', Icons.update),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildProfileHeader(String name) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.teal,
            child: Text(
              name[0],
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
