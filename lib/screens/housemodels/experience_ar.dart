import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModelsDetailScreen extends StatefulWidget {
  const ModelsDetailScreen({super.key});

  @override
  State<ModelsDetailScreen> createState() => _ModelsDetailScreenState();
}

class _ModelsDetailScreenState extends State<ModelsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MyCustomScreen(
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWithNavigation(
              heading: "Experience AR",
              screenToBeRendered: "None",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: SizedBox(
                height: size.height * 0.7,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.5,
                        child: const WebView(
                          initialUrl: 'assets/model_viewer.html',
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
