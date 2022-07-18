import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class DemoNotificationCount extends StatefulWidget {
  const DemoNotificationCount({super.key});

  @override
  State<DemoNotificationCount> createState() => _DemoNotificationCountState();
}

class _DemoNotificationCountState extends State<DemoNotificationCount> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }
    if (!mounted) return;

    setState(() {
      appBadgeSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: const Text('Add badge'),
              onTap: () {
                setState(() {
                  count++;
                });
                _addBadge(count);
              },
            ),
            SizedBox(
              height: Constants.size10,
            ),
            GestureDetector(
                child: const Text('Remove badge'),
                onTap: () {
                  _removeBadge();
                }),
          ],
        ),
      ),
    );
  }

  void _addBadge(int number) {
    // FlutterAppBadger.updateBadgeCount(number);
  }

  void _removeBadge() {
    FlutterAppBadger.removeBadge();
  }
}
