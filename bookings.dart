import 'package:flutter/material.dart';
import 'HotelBookingPage.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  int _selectedTab = 0; // 0: All, 1: Pending

  // Sample bookings data
  final List<Map<String, dynamic>> _bookings = [
    {'id': 1, 'name': 'Hotel California', 'status': 'Pending'},
    {'id': 2, 'name': 'Mountain View Inn', 'status': 'Confirmed'},
    {'id': 3, 'name': 'City Lights Hotel', 'status': 'Pending'},
    {'id': 4, 'name': 'Beachfront Paradise', 'status': 'Confirmed'},
        {'id': 5, 'name': 'Sultan Hazretleri', 'status': 'Pending'},
            {'id': 6, 'name': 'Mystic Island', 'status': 'Pending'},
                {'id': 7, 'name': 'Blue Mosque', 'status': 'Confirmed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: _selectedTab == 0
                ? _buildBookingsList(_bookings)
                : _buildBookingsList(
                    _bookings.where((b) => b['status'] == 'Pending').toList()),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildTabButton('All', 0),
          _buildTabButton('Pending', 1),
        ],
      ),
    );
  }

  Widget _buildBookingsList(List<Map<String, dynamic>> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: const Text('No bookings available'),
      );
    }
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(bookings[index]['name']),
          subtitle: Text(bookings[index]['status']),
          leading: Icon(
            bookings[index]['status'] == 'Pending'
                ? Icons.pending
                : Icons.check_circle,
            color: bookings[index]['status'] == 'Pending'
                ? Colors.orange
                : Colors.green,
          ),
        );
      },
    );
  }

  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    _selectedTab == index ? FontWeight.bold : FontWeight.normal,
                color: _selectedTab == index ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 3,
              color: _selectedTab == index ? Colors.blue : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/offers');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/inbox');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Offers'),
        BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
