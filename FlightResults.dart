import 'package:flutter/material.dart';
import 'FlightResults.dart';

class FlightResultsPage extends StatelessWidget {
  const FlightResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> flights = [
      {
        'airline': 'Air Albania',
        'departure': '19:30',
        'arrival': '20:35',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 5m',
        'price': '5,199',
        'discount': '4,878',
      },
      {
        'airline': 'US Airline',
        'departure': '20:00',
        'arrival': '21:05',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 5m',
        'price': '5,199',
        'discount': '4,757',
      },
      {
        'airline': 'NOVOAIR',
        'departure': '19:30',
        'arrival': '20:35',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 5m',
        'price': '5,199',
        'discount': '4,717',
      },
      {
        'airline': 'Amerigo Vespucci',
        'departure': '16:35',
        'arrival': '17:40',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 5m',
        'price': '2,199',
        'discount': '599',
      },
      {
        'airline': 'Wizz Air',
        'departure': '20:00',
        'arrival': '21:05',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 30m',
        'price': '4,199',
        'discount': '0',
      },
      {
        'airline': 'Lufthansa',
        'departure': '20:00',
        'arrival': '21:05',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '1h 45m',
        'price': '5,499',
        'discount': '0',
      },
      {
        'airline': 'Turkish Airlines',
        'departure': '20:00',
        'arrival': '21:05',
        'from': 'MAC',
        'to': 'CXB',
        'duration': '2h 15m',
        'price': '2,599',
        'discount': '0',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text("Tirana to Istanbul"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: const Center(
                  child: Text(
                    'We are holding your fare     ⏱ 38:09',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text("Cheapest",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("USD 2,199",
                              style: TextStyle(color: Colors.grey)),
                          Divider(thickness: 3, color: Colors.amber, height: 8),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text("Fastest",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("USD 5,199",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: flights.length,
            itemBuilder: (context, index) {
              final flight = flights[index];
              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            flight['airline']!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          const Text("Get Points",
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Text(flight['departure']!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(flight['from']!,
                                style: const TextStyle(color: Colors.grey)),
                          ]),
                          Column(children: [
                            Text(flight['duration']!,
                                style: const TextStyle(color: Colors.grey)),
                            const Text("Non-Stop",
                                style: TextStyle(fontSize: 12)),
                          ]),
                          Column(children: [
                            Text(flight['arrival']!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(flight['to']!,
                                style: const TextStyle(color: Colors.grey)),
                          ]),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("Partially Refundable",
                          style: TextStyle(color: Colors.green)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text("DOMB0325",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          const Spacer(),
                          Text(
                            "USD ${flight['price']}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "USD ${flight['discount']}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              icon: const Icon(Icons.filter_alt),
              label: const Text("Filter"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
