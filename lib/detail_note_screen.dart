import 'package:flutter/material.dart';

class DetailNoteScreen extends StatefulWidget {
  final String note;
  final int index;

  const DetailNoteScreen({super.key, required this.note, required this.index});

  @override
  State<DetailNoteScreen> createState() => _DetailNoteScreenState();
}

class _DetailNoteScreenState extends State<DetailNoteScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == -1 ? "Tambah Catatan" : "Edit Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Isi catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Simpan"),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    _controller.text,
                  ); // kirim balik hasil edit
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
