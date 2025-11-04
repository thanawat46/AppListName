import 'package:flutter/material.dart';

class Detailsimadepage extends StatefulWidget {
  const Detailsimadepage({super.key});

  @override
  State<Detailsimadepage> createState() => _DetailsimadepageState();
}

class _DetailsimadepageState extends State<Detailsimadepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายละเอียดการเข้างาน"),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400x300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'วันที่: 11/04/2568 16.40 น.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}