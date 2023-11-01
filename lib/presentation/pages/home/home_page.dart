import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AppBar(
            title: const Text(
              'Selamat Datang\nKembali!',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF093545)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF093545),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Mulailah',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F7F7),
                          ),
                        ),
                        Text(
                          'Pelajari lebih\nlanjut tentang\nperawatan primer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFF7F7F7),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Mulailah',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F7F7),
                          ),
                        ),
                        Text(
                          'Pelajari lebih\nlanjut tentang\nperawatan primer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFF7F7F7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFED8F27),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go("/riwayat-pemeriksaan");
            },
            child: const Text("riawat"),
          ),
        ],
      ),
    );
  }
}
