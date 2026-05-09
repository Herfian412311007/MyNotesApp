import 'package:flutter/material.dart';
import 'detail_note_screen.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final List<String> _notes = [
    "Belajar Flutter State Management",
    "Membuat UI dengan Widget Dasar",
    "Menguji Callback Function di Flutter",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Catatan"), centerTitle: true),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.note),
              title: Text(_notes[index]),
              onTap: () async {
                // Navigasi ke halaman detail + tunggu hasil edit
                final updatedNote = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailNoteScreen(note: _notes[index], index: index),
                  ),
                );

                // Jika ada hasil edit, update list
                if (updatedNote != null && updatedNote is String) {
                  setState(() {
                    _notes[index] = updatedNote;
                  });
                }
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _notes.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailNoteScreen(note: "", index: -1),
            ),
          );
          if (newNote != null && newNote is String) {
            setState(() {
              _notes.add(newNote);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
