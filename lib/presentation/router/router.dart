import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/presentation/pages/home/home_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: "riwayat-pemeriksaan",
          builder: (context, state) => const RiwayatPemeriksaanPage(),
        )
      ],
    )
  ],
);
