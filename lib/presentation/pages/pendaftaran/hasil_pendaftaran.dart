import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/cards/anchored_text_card.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/cards/tabel_hasil_pendaftaran_card.dart';
import 'package:labkesda_mobile/presentation/components/buttons/download_pendaftaran_button.dart';

final Map dataPendaftaran = {
  'qr_code':
      'https://avatars.githubusercontent.com/u/97578440?s=400&u=2a648e5589a1d9860a985bf88dab4440644319ef&v=4',
  'kode_pelanggan': '23113885911565',
  'nama': 'John Doe',
  'tanggal_lahir': 'Kamis, 19 Mei 1989',
  'no_hp': '08123456789',
  'phone_verified': true,
  'email': 'johndoe@email.com',
  'email_verified': true,
  'alamat': 'Jl. Raya Bogor No. 1, Jakarta Timur',
  'waktu_kunjungan': 'Selasa, 14 November 2023',
  'nomor_antrian': '1',
};

class HasilPendafataranPage extends HookConsumerWidget {
  const HasilPendafataranPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: Transform.translate(
          offset: const Offset(0, 0),
          child: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(
              Icons.chevron_left,
              color: AppColors.primary,
            ),
          ),
        ),
        titleSpacing: 8,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Menu Pendaftaran',
            style: AppStyle.titleAppBar,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            bottom: 40,
            left: 20,
          ),
          decoration: AppStyle.formContainerDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleForm(
                title: 'Bukti Pendaftaran',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.whiteColor,
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    dataPendaftaran['qr_code'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Berikut bukti pendaftaran secara daring, Silahkan unduh dan simpan bukti pendaftaran untuk melakukan verifikasi pada petugas.',
                style: AppStyle.contentText,
              ),
              const SizedBox(
                height: 20,
              ),
              TabelHasilPendaftaranCard(
                data: dataPendaftaran,
              ),
              const SizedBox(
                height: 10,
              ),
              DownLoadPendaftaranButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  WarningSnackbar.show(
                    context,
                    text: 'Coming soon',
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AnchoredTextCard(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  WarningSnackbar.show(
                    context,
                    text: 'Coming soon',
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hasil pemeriksaan akan dikirim ke email atau nomor telepon yang telah Anda daftarkan. Silahkan cek email secara berkala untuk menerima hasil pemeriksaan.',
                style: AppStyle.contentText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
