// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TugasWidget extends StatelessWidget {
  const TugasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Kompleks Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WidgetKompleks(),
    );
  }
}

class WidgetKompleks extends StatelessWidget {
  const WidgetKompleks({super.key});


  final List<Map<String, String>> daftarMahasiswa = const [
    {
      'nama': 'Alamsyah Firdaus',
      'jurusan': 'Teknik Informatika',
      'npm': '2110010123'
    },
    {
      'nama': 'Budi Santoso',
      'jurusan': 'Sistem Informasi',
      'npm': '2110010124'
    },
    {
      'nama': 'Citra Dewi',
      'jurusan': 'Teknik Komputer',
      'npm': '2110010125'
    },
    {
      'nama': 'Dian Pratama',
      'jurusan': 'Teknik Informatika',
      'npm': '2110010126'
    },
    {
      'nama': 'Eka Putri',
      'jurusan': 'Sistem Informasi',
      'npm': '2110010127'
    },
  ];


  final List<Map<String, dynamic>> daftarProduk = const [
    {'nama': 'Laptop', 'icon': Icons.laptop, 'warna': Colors.blue},
    {'nama': 'Smartphone', 'icon': Icons.smartphone, 'warna': Colors.green},
    {'nama': 'Tablet', 'icon': Icons.tablet, 'warna': Colors.orange},
    {'nama': 'Headphone', 'icon': Icons.headphones, 'warna': Colors.purple},
    {'nama': 'Keyboard', 'icon': Icons.keyboard, 'warna': Colors.red},
    {'nama': 'Mouse', 'icon': Icons.mouse, 'warna': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Kompleks'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildSectionTitle('ListView dengan Card'),
              const SizedBox(height: 12),
              _buildListView(context),
              const SizedBox(height: 24),


              _buildSectionTitle('GridView Produk'),
              const SizedBox(height: 12),
              _buildGridView(context),
              const SizedBox(height: 24),


              _buildSectionTitle('Card Informasi'),
              const SizedBox(height: 12),
              _buildInfoCard(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }


  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daftarMahasiswa.length,
      itemBuilder: (context, index) {
        final mahasiswa = daftarMahasiswa[index];
        final inisial = mahasiswa['nama']!
            .split(' ')
            .map((e) => e[0])
            .take(2)
            .join()
            .toUpperCase();

        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue,
              child: Text(
                inisial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            title: Text(
              mahasiswa['nama']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(mahasiswa['jurusan']!),
                Text(
                  'NPM: ${mahasiswa['npm']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Anda memilih: ${mahasiswa['nama']}',
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.blue,
                ),
              );
              ('Item diklik: ${mahasiswa['nama']}');
            },
          ),
        );
      },
    );
  }


  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: daftarProduk.length,
      itemBuilder: (context, index) {
        final produk = daftarProduk[index];
        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Produk dipilih: ${produk['nama']}',
                ),
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                backgroundColor: produk['warna'] as Color,
              ),
            );
            ('Grid item diklik: ${produk['nama']}');
          },
          child: Container(
            decoration: BoxDecoration(
              color: (produk['warna'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (produk['warna'] as Color).withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  produk['icon'] as IconData,
                  size: 48,
                  color: produk['warna'] as Color,
                ),
                const SizedBox(height: 12),
                Text(
                  produk['nama'] as String,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: produk['warna'] as Color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Produk ${index + 1}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Card Informasi diklik!'),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.teal,
            ),
          );
          ('Info card diklik');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      size: 32,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pemrograman Mobile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tugas Mandiri 4',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoItem(
                    Icons.widgets,
                    'Widget Kompleks',
                    Colors.blue,
                  ),
                  _buildInfoItem(
                    Icons.code,
                    'Flutter',
                    Colors.green,
                  ),
                  _buildInfoItem(
                    Icons.school,
                    'Praktikum',
                    Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}