import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://blog.codefactory.ai'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Flutter Blog'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(Uri.parse('https://blog.codefactory.ai'));
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              controller.goBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              controller.goForward();
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
