import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KobantitarWebview extends StatefulWidget {
  final String judul;
  final String url;
  const KobantitarWebview({required this.judul,required this.url, Key? key }) : super(key: key);

  @override
  State<KobantitarWebview> createState() => _KobantitarWebviewState();
}

class _KobantitarWebviewState extends State<KobantitarWebview> {
   final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.judul, style: TextStyle(fontSize: 14.0)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xffED6B6B), Color(0xffF38585)])),
        ),
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {
                   setState(() {
                    isLoading = true;
                  });
                },
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context),
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                },
                onPageFinished: (String url) {
                  setState(() {
                    isLoading = false;
                  });
                },
                gestureNavigationEnabled: true,
                backgroundColor: const Color(0x00000000),
              ),
            ), isLoading
              ? Positioned.fill(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : Stack()

          ],
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String url = (await controller.data!.currentUrl())!;
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
  }
}