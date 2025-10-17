// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TugasWidget extends StatelessWidget {
  const TugasWidget({super.key});

  final List<Map<String, String>> daftarMahasiswa = const [
    {
      'nama': 'Ambiya Rayana Maulidan',
      'jurusan': 'Pendidikan Teknologi Informasi',
      'nim': 'C2383207014'
    },
    {
      'nama': 'Azriel Putra Pertama',
      'jurusan': 'Teknik Informatika',
      'nim': 'C2383207011'
    },
    {
      'nama': 'Deri Hoerun Nasar',
      'jurusan': 'Teknik Komputer',
      'nim': 'C2383207004'
    },
    {
      'nama': 'Rijal Rizki Fauzi',
      'jurusan': 'Pendidikan Teknologi Informasi',
      'nim': 'C2383207009'
    },
    {
      'nama': 'Ranji Kurnia',
      'jurusan': 'Sistem Informasi',
      'nim': 'C2383207010'
    },
  ];


 final List<Map<String, dynamic>> daftarProduk = const [
    {
      'nama': 'Laptop',
      'icon': Icons.laptop,
      'warna': Colors.blue,
      'gambar': 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400'
    },
    {
      'nama': 'Smartphone',
      'icon': Icons.smartphone,
      'warna': Colors.green,
      'gambar': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400'
    },
    {
      'nama': 'Tablet',
      'icon': Icons.tablet,
      'warna': Colors.orange,
      'gambar': 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400'
    },
    {
      'nama': 'Headphone',
      'icon': Icons.headphones,
      'warna': Colors.purple,
      'gambar': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400'
    },
    {
      'nama': 'Keyboard',
      'icon': Icons.keyboard,
      'warna': Colors.red,
      'gambar': 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400'
    },
    {
      'nama': 'Mouse',
      'icon': Icons.mouse,
      'warna': Colors.teal,
      'gambar': 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400'
    },
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
          color: Colors.white,
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
                  'NIM: ${mahasiswa['nim']}',
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

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    produk['gambar'] as String,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: 100,
                        height: 80,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 80,
                        color: (produk['warna'] as Color).withOpacity(0.08),
                        child: Icon(
                          produk['icon'] as IconData,
                          size: 40,
                          color: produk['warna'] as Color,
                        ),
                      );
                    },
                  ),
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
      color: Colors.teal[50],
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 80,
                      height: 80,
                    )
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ambiya Rayana Maulidan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Si Ganteng Kalem',
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
                    FontAwesomeIcons.whatsapp,
                    'WhatsApp',
                    Colors.green,
                  ),
                  _buildInfoItem(
                    FontAwesomeIcons.github,
                    'GitHub',
                    Colors.blueGrey,
                  ),
                  _buildInfoItem(
                    FontAwesomeIcons.school,
                    'UMTAS',
                    Colors.blueAccent,
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