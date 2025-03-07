import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/router/router.dart';
import 'package:labkesda_mobile/presentation/controllers/jenis_layanan/jenis_layanan_controller.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await initializeDateFormatting('id_ID');
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: App()));
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(jenisLayananControllerProvider);
    return GlobalLoaderOverlay(
      closeOnBackButton: true,
      overlayColor: Colors.black.withOpacity(0.5),
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.whiteColor,
          ),
        );
      },
      child: MaterialApp.router(
        title: 'Labkesda Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
