import 'package:flutter/material.dart';

class Gabungan extends StatelessWidget {
  const Gabungan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mahasiswa 1'),
              subtitle: Text('Flutter Developer'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mahasiswa 2'),
              subtitle: Text('UI Designer'),
            ),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[100 * (index + 2)],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.teal,
                ),
                title: Text('Mahasiswa 3'),
                subtitle: Text('Flutter Developer'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
