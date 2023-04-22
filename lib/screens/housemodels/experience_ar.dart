import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience3dVisualizations extends StatelessWidget {
  const Experience3dVisualizations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () async {
          String url = "https://modelviewer.dev/";
          //var urlLauchable = await canLaunchUrl(Uri.parse(url));
          if (!await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          )) {
            throw 'Could not launch $url';
          }
        },
        icon: Icon(
          Icons.architecture,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
