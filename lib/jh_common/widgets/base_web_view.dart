import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jh_flutter_demo/jh_common/utils/jh_device_utils.dart';
import 'package:jh_flutter_demo/base_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends StatefulWidget {
  const BaseWebView({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _BaseWebViewState createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  int _progressValue = 0;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (JhDevice.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async {
              if (snapshot.hasData) {
                final bool canGoBack = await snapshot.data!.canGoBack();
                if (canGoBack) {
                  // 网页可以返回时，优先返回上一页
                  await snapshot.data!.goBack();
                  return Future.value(false);
                }
              }
              return Future.value(true);
            },
            child: Scaffold(
              appBar: backAppBar(context, widget.title),
              body: Stack(
                children: [
                  WebView(
                    initialUrl: widget.url,
                    javascriptMode: JavascriptMode.unrestricted,
                    allowsInlineMediaPlayback: true,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onProgress: (int progress) {
//                      debugPrint('WebView is loading (progress : $progress%)');
                      setState(() {
                        _progressValue = progress;
                      });
                    },
                  ),
                  if (_progressValue != 100)
                    LinearProgressIndicator(
                      value: _progressValue / 100,
                      backgroundColor: Colors.transparent,
                      minHeight: 2,
                    )
                  else
                    SizedBox.shrink(),
                ],
              ),
            ),
          );
        });
  }
}
