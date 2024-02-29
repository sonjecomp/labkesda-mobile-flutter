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
          onProgress: (int progress) {
            if (progress == 100) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });

            _controller.runJavaScript("""
              document.getElementById("kode").value = "$kodePemeriksaan";
              document.querySelector('button[type="submit"]').click();
              """);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
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
