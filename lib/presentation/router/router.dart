import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/presentation/pages/layanan/daftar_layanan_page.dart';
import 'package:labkesda_mobile/presentation/pages/on_board/on_board_page.dart';
import 'package:labkesda_mobile/presentation/components/layouts/bottom_bar_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/hasil_pemeriksaan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan/riwayat_pemeriksaan_detail_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan/riwayat_pemeriksaan_result_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pilih_status_pendaftaran.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/pendaftaran_pasien_lama_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/pendaftaran_instansi_lama_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/pendaftaran_instansi_baru_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/pendaftaran_instansi_baru_tanpa_mou.dart';

final router = GoRouter(
  initialLocation: "/on-board",
  routes: [
    GoRoute(
      path: "/on-board",
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const BottomBarLayout();
      },
      routes: [
        GoRoute(
          path: "hasil-pemeriksaan",
          builder: (context, state) => const HasilPemeriksaanPage(),
        ),
        GoRoute(
          path: "riwayat-pemeriksaan",
          builder: (context, state) => const RiwayatPemeriksaanPage(),
          routes: [
            GoRoute(
                path: "hasil-pencarian-riwayat-pemeriksaan",
                builder: (context, state) =>
                    const RiwayatPemeriksaanResultPage(),
                routes: [
                  GoRoute(
                    path: "detail-pemeriksaan",
                    builder: (context, state) =>
                        const RiwayatPemeriksaanDetailPage(),
                  ),
                ]),
          ],
        ),
        GoRoute(
          path: "pilih-status-pendaftaran",
          builder: (context, state) {
            return const PilihStatusPendaftaran();
          },
          routes: [
            GoRoute(
              path: "pasien-baru",
              builder: (context, state) {
                return const PendaftaranPasienBaru();
              },
            ),
            GoRoute(
              path: "pasien-lama",
              builder: (context, state) {
                return const PendaftaranPasienLama();
              },
            ),
            GoRoute(
              path: "instansi-baru",
              builder: (context, state) {
                return const PendaftaranInstansiBaru();
              },
              routes: [
                GoRoute(
                  path: "tanpa-mou",
                  builder: (context, state) {
                    return const PendaftaranInstansiBaruTanpaMou();
                  },
                ),
                GoRoute(
                  path: "ada-mou",
                  builder: (context, state) {
                    return const PendaftaranInstansiBaruAdaMou();
                  },
                ),
              ],
            ),
            GoRoute(
              path: "instansi-lama",
              builder: (context, state) {
                return const PendaftaranInstansiLama();
              },
            ),
          ],
        ),
        GoRoute(
          path: "daftar-layanan",
          builder: (context, state) {
            return const DaftarLayanan();
          },
        ),
      ],
    ),
  ],
);
