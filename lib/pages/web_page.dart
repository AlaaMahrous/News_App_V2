import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key, required this.url});
  final String url;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController controller;
  bool isLoading = true; 
  bool hasError = false; 

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
              hasError = false; 
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false;
              hasError = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void reloadPage() {
    setState(() {
      isLoading = true;
      hasError = false; 
    });
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Offstage(
            offstage: isLoading || hasError, 
            child: WebViewWidget(controller: controller),
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
          if (hasError) 
            errorReloadMessage(),
        ],
      ),
    );
  }

  Center errorReloadMessage() {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 50, color: Color(0xffFF903D)),
                const SizedBox(height: 10),
                const Text(
                  'An error occurred while loading the page',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: reloadPage,
                  child: const Text('Try again'),
                ),
              ],
            ),
          );
  }
}
