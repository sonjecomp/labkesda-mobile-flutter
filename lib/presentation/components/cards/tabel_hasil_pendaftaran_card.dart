import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/models/pemeriksaan/pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class TabelHasilPendaftaranCard extends HookConsumerWidget {
  const TabelHasilPendaftaranCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Pemeriksaan data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(0.1),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Kode Pelanggan',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                data.user.kodePendaftaran,
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Nama Pelanggan',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                data.user.name,
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Tanggal Lahir',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                data.user.tanggalLahir ?? '',
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Nomor Telepon',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Wrap(
                children: [
                  Text(
                    data.user.noHP,
                    style: AppStyle.cellsStyle,
                  ),
                  Text(
                    data.user.statusVerifNoPhone ? '(Sudah Terverifikasi)' : '(Belum Terverifikasi)',
                    style: TextStyle(
                      color: data.user.statusVerifNoPhone ? Colors.green : Colors.red,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Email',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Wrap(
                children: [
                  Text(
                    data.user.email ?? '',
                    style: AppStyle.cellsStyle,
                  ),
                  Text(
                    data.user.statusVerifEmail ? '(Sudah Terverifikasi)' : '(Belum Terverifikasi)',
                    style: TextStyle(
                      color: data.user.statusVerifEmail ? Colors.green : Colors.red,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Alamat',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                data.user.alamatDomisili,
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Waktu Kunjungan',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                DateFormat('dd/MM/yyyy').format(data.antrianPasien.waktuKunjungan),
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Nomor Urut Antrian',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                ':',
                style: AppStyle.cellsStyle,
              ),
            ),
            TableCell(
              child: Text(
                data.antrianPasien.noAntrian.toString(),
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
