// This is the electrician page.

import 'package:flutter/material.dart';

class ProfessionGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          electricians.length,
          (index) {
            return Hero(
              tag: 'electrician_$index',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ElectricianDetailsPage(
                        electrician: electricians[index],
                        tag: 'electrician_$index',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        electricians[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        electricians[index].specialization,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Electrician {
  final String name;
  final String specialization;

  Electrician({required this.name, required this.specialization});
}

final List<Electrician> electricians = [
  Electrician(name: 'John Doe', specialization: 'Residential Electrician'),
  Electrician(name: 'Jane Smith', specialization: 'Commercial Electrician'),
  Electrician(name: 'Bob Johnson', specialization: 'Industrial Electrician'),
];

class ElectricianDetailsPage extends StatelessWidget {
  final Electrician electrician;
  final String tag;

  ElectricianDetailsPage({required this.electrician, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Hero(
            tag: tag,
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            electrician.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            electrician.specialization,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}