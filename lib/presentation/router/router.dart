import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/presentation/components/layouts/bottom_bar_layout.dart';
import 'package:labkesda_mobile/presentation/pages/on_board/on_board_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/riwayat_pemeriksaan_page.dart';

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
          path: "riwayat-pemeriksaan",
          builder: (context, state) => const RiwayatPemeriksaanPage(),
        )
      ],
    )
  ],
);
