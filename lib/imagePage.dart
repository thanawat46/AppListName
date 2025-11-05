import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class imagepage extends StatefulWidget {
  const imagepage({super.key});

  @override
  State<imagepage> createState() => _imagepageState();
}

class _imagepageState extends State<imagepage> {
  String? _imagePath;
  DateTime? _capturedDate;
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        setState(() {
          _imagePath = image.path;
          _capturedDate = DateTime.now();
        });
      }
    } catch (e) {
      print("เกิดข้อผิดพลาดตอนเปิดกล้อง: $e");
    }
  }

  void _deleteImage() {
    setState(() {
      _imagePath = null;
      _capturedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ถ่ายรูปเพื่อเข้างาน"),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: _imagePath == null
                  ? const Icon(
                Icons.image_search,
                size: 80,
                color: Colors.white,
              )
                  : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.file(
                  File(_imagePath!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            if (_capturedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "วันที่ถ่าย: ${_capturedDate!.day}/${_capturedDate!.month}/${_capturedDate!.year + 543} เวลา ${_capturedDate!.hour.toString().padLeft(2, '0')}:${_capturedDate!.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: _deleteImage,
                    icon: const Icon(Icons.delete),
                    label: const Text('ลบรูป'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: _openCamera,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('ถ่ายรูป'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}