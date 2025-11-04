import 'package:flutter/material.dart';
import 'DetailsImadePage.dart';
import 'imagepage.dart'; // เพิ่มการ import

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  final String name = 'ชื่อ นามสกุล';
  final String id = 'รหัสพนักงาน';

  final List<String> timeRecords = [
    '11/04/2568 16.40 น.',
    '11/04/2568 07.50 น.',
    '10/04/2568 16.30 น.',
    '11/04/2568 07.46 น.',
    '09/04/2568 16.35 น.',
    '09/04/2568 07.55 น.',
    '08/04/2568 16.42 น.',
    '08/04/2568 07.49 น.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text(id),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const imagepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "รายละเอียดการเข้างาน",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "วัน/เดือน/ปี เวลา",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: timeRecords.length,
                  itemBuilder: (context, index) {
                    final record = timeRecords[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(
                          record.contains('07.') ? Icons.login : Icons.logout,
                          color: record.contains('07.') ? Colors.green : Colors.red,
                        ),
                        title: Text(
                          record,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          record.contains('07.') ? 'บันทึกเวลาเข้างาน' : 'บันทึกเวลาออกงาน',
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Detailsimadepage()),
                            );
                          },
                          child: const Text('แสดงรูป'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Row(
              children: [
                Text(
                  "พิกัดปัจจุบัน : 10.000 / 20.000",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}