import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/models/pemeriksaan/pemeriksaan.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';
import 'package:labkesda_mobile/models/riwayat_pemeriksaan/riwayat_pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/pages/promo/promo_page.dart';
import 'package:labkesda_mobile/presentation/pages/on_board/on_board_page.dart';
import 'package:labkesda_mobile/presentation/pages/search/search_layanan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/hasil_pendaftaran.dart';
import 'package:labkesda_mobile/presentation/components/layouts/bottom_bar_layout.dart';
import 'package:labkesda_mobile/presentation/pages/search/search_paket_layanan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/hasil_pemeriksaan_page.dart';
import 'package:labkesda_mobile/presentation/pages/paket_dan_layanan/detail_paket_page.dart';
import 'package:labkesda_mobile/presentation/pages/paket_dan_layanan/daftar_paket_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pilih_status_pendaftaran.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan_page.dart';
import 'package:labkesda_mobile/presentation/pages/search/search_paket_dan_layanan_page.dart';
import 'package:labkesda_mobile/presentation/pages/paket_dan_layanan/daftar_layanan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/pendaftaran_pasien_lama_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/pendaftaran_instansi_lama_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/pendaftaran_instansi_baru_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan/riwayat_pemeriksaan_detail_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan/riwayat_pemeriksaan_result_page.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/pendaftaran_instansi_baru_tanpa_mou.dart';
import 'package:labkesda_mobile/presentation/pages/splash/splash_page.dart';

final router = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/on-board",
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const BottomBarLayout();
      },
      routes: <RouteBase>[
        GoRoute(
          path: "hasil-pemeriksaan",
          builder: (context, state) => const HasilPemeriksaanPage(),
        ),
        GoRoute(
          path: "hasil-pendaftaran",
          builder: (context, state) => HasilPendafataranPage(
            pemeriksaan: state.extra as Pemeriksaan,
          ),
        ),
        GoRoute(
          path: "riwayat-pemeriksaan",
          builder: (context, state) => const RiwayatPemeriksaanPage(),
          routes: [
            GoRoute(
              path: "hasil-pencarian-riwayat-pemeriksaan",
              builder: (context, state) => RiwayatPemeriksaanResultPage(
                data: state.extra as List<RiwayatPemeriksaan>,
              ),
              routes: [
                GoRoute(
                  path: "detail-pemeriksaan",
                  builder: (context, state) => RiwayatPemeriksaanDetailPage(
                    data: state.extra as RiwayatPemeriksaan,
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: "detail-promo",
          builder: (context, state) {
            final PromoModels detailPromo = state.extra as PromoModels;
            return DetailPenawaranPromo(
              detailPromo: detailPromo,
            );
          },
        ),
        GoRoute(
          path: "pilih-status-pendaftaran",
          builder: (context, state) {
            return const PilihStatusPendaftaran();
            // return const OtpPage();
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
          path: "daftar-paket",
          builder: (context, state) {
            return const DaftarPaketPage();
          },
          routes: [
            GoRoute(
              path: "detail-paket",
              builder: (context, state) {
                final PaketLayanan detailPaketLayanan = state.extra as PaketLayanan;
                return DetailPaketPemeriksaanPage(
                  detailPaketLayanan: detailPaketLayanan,
                );
              },
            )
          ],
        ),
        GoRoute(
          path: "daftar-layanan",
          builder: (context, state) {
            return const DaftarLayananPage();
          },
        ),
        GoRoute(
          path: "search-paket-dan-layanan",
          builder: (context, state) {
            return const SearchPaketDanLayananPage();
          },
        ),
        GoRoute(
          path: "search-paket-layanan",
          builder: (context, state) {
            return const SearchPaketLayananPage();
          },
        ),
        GoRoute(
          path: "search-layanan",
          builder: (context, state) {
            return const SearchLayananPage();
          },
        ),
      ],
    ),
  ],
);
