import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LayoutRulesExample(),
  ));
}

class LayoutRulesExample extends StatelessWidget {
  const LayoutRulesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiga Aturan Layout Flutter'),
      ),
      body: MyPages1(),
   );
 }
}

class MyPages1 extends StatelessWidget {
  const MyPages1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1 & 2. Aturan Constraints (Batas) dan Size (Ukuran)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Induk memaksa anak berada di batas 100x100 hingga 200x200. Anak meminta ukuran 500x50, tapi dipaksa mengikuti batas induk (mentok di lebar 200, tinggi 100).'),
              const SizedBox(height: 10),
              
              // CONTOH ATURAN 1 & 2
              ConstrainedBox(
                // INDUK memberikan constraints ke bawah (Constraints turun)
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 100,
                  maxHeight: 200,
                ),
                // ANAK mencoba menentukan ukuran (Ukuran naik)
                child: Container(
                  width: 500, // Mencoba lebih besar dari maxWidth (Gagal, dipaksa 200)
                  height: 50, // Mencoba lebih kecil dari minHeight (Gagal, dipaksa 100)
                  color: Colors.blue,
                  child: const Text(
                    'Saya minta 500x50, tapi dapatnya 200x100',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}


