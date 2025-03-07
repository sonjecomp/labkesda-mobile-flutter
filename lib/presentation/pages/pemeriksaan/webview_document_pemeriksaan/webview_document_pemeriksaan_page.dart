import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDocumentPemeriksaanPage extends StatefulWidget {
  const WebViewDocumentPemeriksaanPage({super.key, required this.kodePemeriksaan});

  final String kodePemeriksaan;

  @override
  State<WebViewDocumentPemeriksaanPage> createState() => _WebViewDocumentPemeriksaanPageState();
}

class _WebViewDocumentPemeriksaanPageState extends State<WebViewDocumentPemeriksaanPage> {
  late WebViewController _controller;

  bool isLoading = true;
  int isFrontPage = 0;
  String kodePemeriksaan = '';
  late SharedPreferences prefs;

  void getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    kodePemeriksaan = prefs.getString('kodePemeriksaan') ?? '';
  }

  @override
  void initState() {
    super.initState();

    getSharedPrefs();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isFrontPage++;
            });

            _controller.runJavaScript("""
              document.getElementById("kode").value = "$kodePemeriksaan";
              document.querySelector('button[type="submit"]').click();
              """);
          },
          onUrlChange: (UrlChange url) {
            print('ABC onUrlChange: $url');
            print('ABCC isFrontPage: $isFrontPage');
            if (isFrontPage >= 1) {
              Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  isLoading = false;
                });
              });
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            print('ABC allowing navigation to $request');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://sistem.labkes.lampungprov.go.id/hasil-pemeriksaan',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          if (isLoading)
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
