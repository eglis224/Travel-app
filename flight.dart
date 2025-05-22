import 'package:flutter/material.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({Key? key}) : super(key: key);

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  String fromCity = 'Tirana';
  String fromAirport = 'Tirana, Tirana International Airport';
  String toCity = "Istanbul";
  String toAirport = "ISB, Istanbul Havalimani Airport";
  DateTime departureDate = DateTime.now();
  bool showResults = false;
  List<Flight> flights = [];

  @override
  void initState() {
    super.initState();
    // Sample flight data
    flights = [
      Flight(
        airline: 'Provence, France',
        flightNumber: 'PF 101',
        departureTime: '08:00 AM',
        arrivalTime: '10:15 AM',
        duration: '2h 15m',
        price: 'ALL 8,500',
      ),
      Flight(
        airline: 'Tuscany, Italy',
        flightNumber: 'TI 201',
        departureTime: '11:30 AM',
        arrivalTime: '12:45 PM',
        duration: '1h 15m',
        price: 'ALL 7,800',
      ),
      Flight(
        airline: 'Marmara Region, Turkey',
        flightNumber: 'NR 301',
        departureTime: '03:15 PM',
        arrivalTime: '04:30 PM',
        duration: '1h 45m',
        price: 'ALL 9,200',
      ),
      Flight(
        airline: 'Rome Fiumicino , Italy',
        flightNumber: 'RF 501',
        departureTime: '03:15 PM',
        arrivalTime: '04:15 PM',
        duration: '1h',
        price: 'ALL 7,200',
      ),
      Flight(
        airline: 'Barcelona , Spain',
        flightNumber: 'BC 309',
        departureTime: '9:15 PM',
        arrivalTime: '11:45 PM',
        duration: '2h 30m',
        price: 'ALL 16,200',
      ),
      Flight(
        airline: 'London , United Kingdom',
        flightNumber: 'UK 775',
        departureTime: '12:30 AM',
        arrivalTime: '15:00 AM',
        duration: '2h 30m',
        price: 'ALL 26,200',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (showResults) {
      return _buildResultsPage();
    }
    return _buildBookingPage();
  }

  Widget _buildBookingPage() {
    String formattedDate =
        "${departureDate.day} ${_getMonthAbbreviation(departureDate.month)}";
    String formattedDay = _getWeekdayName(departureDate.weekday);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flights'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTripTypeSelector(),
            const SizedBox(height: 20),
            _buildLocationTile('From', fromCity, fromAirport, (city, airport) {
              setState(() {
                fromCity = city;
                fromAirport = airport;
              });
            }),
            _buildLocationTile('To', toCity, toAirport, (city, airport) {
              setState(() {
                toCity = city;
                toAirport = airport;
              });
            }),
            _buildDateSelector('Departure', formattedDate, formattedDay,
                (picked) {
              setState(() {
                departureDate = picked;
              });
            }),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('+ ADD RETURN DATE',
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 10),
            _buildInfoTile('TRAVELERS', '01'),
            _buildInfoTile('CLASS', 'Economy'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  setState(() {
                    showResults = true;
                  });
                },
                child:
                    const Text('Search', style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.flight_takeoff, color: Colors.black54),
                  const SizedBox(width: 10),
                  const Expanded(child: Text('How to Book Flight?')),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Watch Video',
                        style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Hot Deals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    height: 80,
                    child: const Center(child: Text('Deal 1')),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    height: 80,
                    child: const Center(child: Text('Deal 2')),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResultsPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('$fromCity to $toCity'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              showResults = false;
            });
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          return _buildFlightCard(flights[index]);
        },
      ),
    );
  }

  Widget _buildFlightCard(Flight flight) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(flight.airline,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(flight.flightNumber,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(flight.departureTime,
                        style: const TextStyle(fontSize: 18)),
                    Text(fromCity, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: [
                    Text(flight.duration,
                        style: const TextStyle(color: Colors.grey)),
                    const Icon(Icons.flight, color: Colors.blue),
                  ],
                ),
                Column(
                  children: [
                    Text(flight.arrivalTime,
                        style: const TextStyle(fontSize: 18)),
                    Text(toCity, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Details',
                      style: TextStyle(color: Colors.blue)),
                ),
                Text(
                  flight.price,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods for date formatting without intl package
  String _getMonthAbbreviation(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }

  String _getWeekdayName(int weekday) {
    const weekdays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return weekdays[weekday - 1];
  }

  // Trip type selector widget
  Widget _buildTripTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabButton('One Way', true),
        _buildTabButton('Round Way', false),
        _buildTabButton('Multi City', false),
      ],
    );
  }

  Widget _buildTabButton(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.yellow[700] : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }

  // Location tile widget
  Widget _buildLocationTile(String title, String city, String airport,
      void Function(String, String) onSelected) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(
                  title: const Text("Marseille"),
                  subtitle:
                      const Text("MAC, Marseille Provence Airport"),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(
                        "France", "MAC, Marseille Provence Airport");
                  },
                ),
                ListTile(
                  title: const Text("Amerigo"),
                  subtitle:
                      const Text("AGP, Amerigo Vespucci Airport"),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(
                        "Italy", "AGP, Amerigo Vespucci Airport");
                  },
                ),
                ListTile(
                  title: const Text("Istanbul"),
                  subtitle: const Text("ISB, Istanbul Havalimani Airport"),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected("Istanbul", "ISB, Istanbul Havalimani Airport");
                  },
                ),
              ],
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(city,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(airport, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Date selector widget
  Widget _buildDateSelector(String title, String date, String day,
      void Function(DateTime) onSelected) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: departureDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          onSelected(picked);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(date,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(day, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Info tile widget
  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class Flight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String price;

  Flight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
  });
}
