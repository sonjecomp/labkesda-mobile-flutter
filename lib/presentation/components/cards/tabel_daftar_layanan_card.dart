import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class TabelDaftarLayananCard extends HookConsumerWidget {
  const TabelDaftarLayananCard({Key? key, required this.daftarLayanan})
      : super(key: key);

  final List<Layanan> daftarLayanan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int rowNumber = 0;
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        dataTextStyle: AppStyle.contentDescText,
        headingRowHeight: 60,
        columnSpacing: 16,
        columns: const [
          DataColumn(
            label: Text(
              'No.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Layanan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Harga',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: daftarLayanan.map((layanan) {
          rowNumber++;
          return DataRow(
            cells: [
              DataCell(
                Text(
                  '$rowNumber.',
                ),
              ),
              DataCell(
                Text(
                  layanan.name,
                ),
              ),
              DataCell(
                Text(
                  layanan.harga,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
