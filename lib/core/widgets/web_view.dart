import 'package:flutter/material.dart';
import 'package:test/core/widgets/custom_app_bar.dart';
import 'package:test/core/widgets/custom_loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool loading = false;
  int count = 0;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              setState(() {
                loading = false;
              });
            }
          },
          onPageStarted: (String url) {
            setState(() {
              if (count == 0) {
                count++;
                loading = true;
              }
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.title, context: context),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(
                  controller: _webViewController!,
                ),
                if (loading == true) ...[
                  Material(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: const Center(child: CustomLoadingIndicator()),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
