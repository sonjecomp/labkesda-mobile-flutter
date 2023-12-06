import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class TabelHasilPendaftaranCard extends HookConsumerWidget {
  final Map data;
  const TabelHasilPendaftaranCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kodePelanggan = data['kode_pelanggan'];
    final namaPelanggan = data['nama'];
    final tglLahirPelanggan = data['tanggal_lahir'];
    final noTelpPelanggan = data['no_hp'];
    final phoneVerified = data['phone_verified'];
    final emailPelanggan = data['email'];
    final emailVerified = data['email_verified'];
    final alamatPelanggan = data['alamat'];
    final waktuKunjungan = data['waktu_kunjungan'];
    final nomorAntrian = data['nomor_antrian'];

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
                kodePelanggan,
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
                namaPelanggan,
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
                tglLahirPelanggan,
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
                    noTelpPelanggan,
                    style: AppStyle.cellsStyle,
                  ),
                  Text(
                    phoneVerified
                        ? '(Sudah Terverifikasi)'
                        : '(Belum Terverifikasi)',
                    style: TextStyle(
                      color: phoneVerified ? Colors.green : Colors.red,
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
                    emailPelanggan,
                    style: AppStyle.cellsStyle,
                  ),
                  Text(
                    emailVerified
                        ? '(Sudah Terverifikasi)'
                        : '(Belum Terverifikasi)',
                    style: TextStyle(
                      color: emailVerified ? Colors.green : Colors.red,
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
                alamatPelanggan,
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
                waktuKunjungan,
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
                nomorAntrian,
                style: AppStyle.cellsStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
