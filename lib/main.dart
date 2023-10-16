import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  Color _appBarColor = Colors.blue;
  String _appBarTitle = 'Profil Saya';
  Widget _appBarActions = Container();

  final List<Widget> _pages = [
    HomeScreen(),
    Center(
      child: ProfileWidget(
        imageUrl: '../asset/image/man.png',
        name: 'Tandrian',
        description: 'Deskripsi singkat tentang Anda.',
        contacts: ['Email: email@example.com', 'Telepon: 123-456-789'],
      ),
    ),
    SkillsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        _appBarTitle = 'Home';
        _appBarActions = Container();
      } else if (_selectedIndex == 1) {
        _appBarTitle = 'Profil';
        _appBarActions = IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Tambahkan aksi yang sesuai di sini
          },
        );
      } else {
        _appBarTitle = 'Keahlian';
        _appBarActions = Container();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        backgroundColor: _appBarColor,
        actions: <Widget>[
          _appBarActions,
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Keahlian',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah halaman utama (Home).'),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final List<String> contacts;

  ProfileWidget({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 80.0,
          ),
          SizedBox(height: 20.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contacts.map((contact) {
              return Text(
                contact,
                style: TextStyle(fontSize: 16.0),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah halaman Keahlian.'),
    );
  }
}
